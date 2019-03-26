library(rcreds)


### Name: credentials_functions
### Title: Credentials Functions
### Aliases: credentials_functions write_credentials_to_file
###   read_credentials_from_file read_db_credentials_from_file
###   write_db_credentials_to_file

### ** Examples


 ## Not run: 
##D    library(rcreds)
##D  
##D    some_login_function <- function(username, password) {
##D      ## does something with username/password
##D      ## ... 
##D    }
##D  
##D    ### ---------------------------------------------- ###
##D    ## Default Folders need to be set. This shold be in an .Rprofile file
##D    ### ---------------------------------------------- ###
##D    ## generally use:  set_default_rcreds_ALL(parent_folder = "~/.rcreds/")
##D    set_default_rcreds_ALL(parent_folder = file.path(tempdir(), ".rcreds/"), 
##D                           create_if_not_exist = TRUE)
##D    ### ---------------------------------------------- ###
##D  
##D    ## ONE TIME, DO NOT SAVE THIS 
##D    write_db_credentials_to_file(username="cosmo", password="still too many secrets"
##D                               , port=1234, host="ec2-1234-567-89.us-west.compute.amazonaws.com")
##D  
##D  
##D    ## SEPARATELY, in a new file:
##D    credentials_list <- read_db_credentials_from_file(fail_if_cant_decrypt=FALSE, showWarnings=FALSE)
##D    ## normally, leave the above flags as their default TRUE. Using FALSE for this example only.
##D  
##D    some_login_function(username = credentials_list$user_name
##D                      , password = credentials_list$password
##D                       )
##D  
## End(Not run)





