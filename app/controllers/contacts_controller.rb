class ContactsController < ApplicationController
  
  def index
    @contact = Contact.all
  end

  def show
  end

  def new 
    contact = Contact.new(params[:contact])
  end

  def create
    
    @contact = Contact.new(params[:contact])

      respond_to do |format|

        if @contact.save
          format.html {redirect_to welcome_contact_path, notice: "Contact was saved."}
          format.json {render :show, status: :created, location: @contact}
        else
          format.html {render welcome_contact_path}
          format.json {render json: @contact.errors, status: :unprocessable_entity}
        end
      end

  end 

end
