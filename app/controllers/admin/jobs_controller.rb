class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :index]
  before_action :require_is_admin
  def index
    @jobs = Job.all
  end
 def new
   @job = Job.new
 end
 def show
   @job = Job.find(params[:id])
 end
 def edit
   @job = Job.find(params[:id])
 end
 def create
   @job = Job.new(job_params)
   @job.save
   redirect_to admin_job_path
 end
 def update
   @job = Job.find(params[:id])
   @job.update(job_params)
   redirect_to admin_job_path
 end
 def destroy
   @job = Job.find(params[:id])
   @job.destroy
   redirect_to admin_job_path
 end




 private
  def job_params
    params.requrie(:jobs).permit(:title, :description)
  end











end
