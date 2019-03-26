library(alterryx)


### Name: app_jobs
### Title: Get App Jobs
### Aliases: app_jobs get_app_jobs get_job

### ** Examples

## Not run: 
##D # get the five most recently queued jobs for an app
##D request_params <- list(
##D   sortField = "createdate",
##D   limit = "5"
##D )
##D 
##D get_app_jobs(app, request_params)
##D 
##D # queue a job and poll the job's status until it is "Completed"
##D job <- queue_job(app, answers)
##D 
##D while(job$status != "Completed") {
##D job <- get_job(job)
##D Sys.sleep(2)
##D }
## End(Not run)




