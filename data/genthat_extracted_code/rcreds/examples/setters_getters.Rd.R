library(rcreds)


### Name: setters_getters
### Title: Setter Getter for Default rcreds Folders
### Aliases: setters_getters get_default_rcreds_folder
###   set_default_rcreds_folder clear_default_rcreds_folder
###   get_default_rcreds_key_folder set_default_rcreds_key_folder
###   clear_default_rcreds_key_folder set_default_rcreds_ALL

### ** Examples


 ## Not run: 
##D    library(rcreds)
##D 
##D    set_default_rcreds_folder("~/.rcreds/credential_files")
##D    creds_folder <- get_default_rcreds_folder()
##D    creds_folder
##D 
##D    set_default_rcreds_folder("~/.rcreds/db_credential_files", DB=TRUE)
##D    db_creds_folder <- get_default_rcreds_folder(DB=TRUE)
##D    db_creds_folder
##D 
##D    set_default_rcreds_key_folder("~/.rcreds/key_files")
##D    rcreds_key_folder <- get_default_rcreds_key_folder()
##D    rcreds_key_folder
##D  
##D    ## ---------------------------------------------- ##
##D 
##D    ## Alternatively, set them all in one shot
##D    set_default_rcreds_ALL(parent_folder = "~/.rcreds")
##D 
##D    ## All three values will be set
##D    get_default_rcreds_folder()
##D    get_default_rcreds_folder(DB=TRUE)
##D    get_default_rcreds_key_folder()
##D  
## End(Not run)




