Rails.application.routes.draw do
  root to: 'homes#show'

  resources :users, only: [:new,:create]
  resources :items, except: [:new,:create]
  resources :orders, except: [:new]
  resources :categories, only: [:index]

  get '/dashboard' => "users#show", as: "user"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/cart', to: 'item_carts#create'
  get '/cart', to: 'item_carts#show'
  put '/cart/:id/dec', to: 'item_carts#decrement', as: 'decrement'
  put '/cart/:id/inc', to: 'item_carts#increment', as: 'increment'
  delete '/cart', to: 'item_carts#destroy'

  get "/:name" => "categories#show", as: "category"



  namespace :admin do
      get '/dashboard' => "users#show"
      resources :users, only: [:edit, :update]
      # get '/dashboard/:id/edit' => "users#edit", as: "edit_user"
      # put '/dashboard' => "users#update"
  end
end
