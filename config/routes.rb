RideFinderApp::Application.routes.draw do
  resources :rides, :states, :causes, :users
  resources :sessions,  only: [:new, :create, :destroy]

  get "users/new"
  get "info/home"
  get "info/about"
  get "inquiries/new"

  resources :users do
    resources :rides, :causes
  end

  resources :rides do
    resources :users, :causes, :states
  end

  resources :states do
    resources :rides, :causes
  end

  root :to => 'info#home'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
   
  match '/about', to: 'info#about'
  match '/contact', to: 'inquiries#new'
  match '/help', to: 'info#help'

 #  match '/newride', to: 'rides#new'
 # match '/editride', to: 'rides#edit'
 #  match '/showride', to: 'rides#show'
 #  match '/listrides', to: 'rides#index'
 


  resources :inquiries, :only => [:new, :create] do
  get 'thank_you', :on => :collection
end



  # resources :states


  # resources :causes


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
