Rails.application.routes.draw do

   #  devise_for 'jinda/user', controllers: { sessions: 'sessions'}

  # start jiinda method routes
  jinda_methods = ['pending','status','search','doc','logs','ajax_notice']
  jinda_methods += ['init','run','run_do','run_form','end_form','error_logs', 'notice_logs', 'cancel']
  jinda_methods.each do |aktion| get "/jinda/#{aktion}" => "jinda##{aktion}" end
  post '/jinda/init' => 'jinda#init'
  post '/jinda/pending' => 'jinda#index'
  post '/jinda/end_form' => 'jinda#end_form'
  mount Ckeditor::Engine => '/ckeditor'
  # end jinda method routes
  
  devise_for :user , path: 'jinda/user', class_name: 'Jinda::User', controllers: {sessions: 'jinda/sessions', omniauth_callbacks: 'jinda/sessions'}

  # devise_for 'jinda/user', skip: :all
  # devise_scope 'jinda/user' do

  # post '/auth/:provider/callback' => 'jinda/sessions#create'
  # get '/auth/:provider/callback' => 'jinda/sessions#create'
  # post '/auth/:provider' => 'jinda/sessions#create'
  # get '/auth/:provider' => 'jinda/sessions#create'
  # get '/auth/failure' => 'jinda/sessions#destroy'
  # get '/logout' => 'jinda/sessions#destroy', :as => 'logout'
  # end

  get '/articles/my' => 'articles/my'
  get '/articles/my/destroy' => 'articles#destroy'
  resources :articles
  resources :users
  resources :identities
  resources :sessions
  resources :password_resets
  resources :jinda, :only => [:index, :new]
  root :to => 'jinda#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
