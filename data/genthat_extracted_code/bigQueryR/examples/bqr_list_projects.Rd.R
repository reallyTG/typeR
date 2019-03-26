library(bigQueryR)


### Name: bqr_list_projects
### Title: List Google Dev Console projects you have access to
### Aliases: bqr_list_projects

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
## End(Not run)




