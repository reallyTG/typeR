library(bigQueryR)


### Name: bqr_list_datasets
### Title: List BigQuery datasets
### Aliases: bqr_list_datasets

### ** Examples


## Not run: 
##D   library(bigQueryR)
##D   
##D   ## this will open your browser
##D   ## Authenticate with an email that has access to the BigQuery project you need
##D   bqr_auth()
##D   
##D   ## verify under a new user
##D   bqr_auth(new_user=TRUE)
##D   
##D   ## get projects
##D   projects <- bqr_list_projects()
##D   
##D   my_project <- projects[1]
##D   
##D   ## for first project, get datasets
##D   datasets <- bqr_list_datasets[my_project]
##D   
## End(Not run)




