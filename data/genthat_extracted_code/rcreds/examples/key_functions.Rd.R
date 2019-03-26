library(rcreds)


### Name: key_functions
### Title: Key Functions
### Aliases: key_functions show_default_rcreds_key_file create_key
###   is.key_rcreds save_key read_key_from_file

### ** Examples


 ## Not run: 
##D    ### ---------------------------------------------- ###
##D    ## Default Folders need to be set. This shold be in an .Rprofile file
##D    ### ---------------------------------------------- ###
##D    ## generally use:  set_default_rcreds_ALL(parent_folder = "~/.rcreds/")
##D    set_default_rcreds_ALL(parent_folder = file.path(tempdir(), ".rcreds/"), 
##D                           create_if_not_exist = TRUE)
##D    ### ---------------------------------------------- ###
##D 
##D    library(rcreds)
##D 
##D    key <- create_key()
##D 
##D    file_creds <- write_credentials_to_file(username="cosmo", password="too many secrets", key=key)
##D    file_key   <- save_key(folder="different/key/location")
##D 
##D    ### IN ANOTHER FILE
##D    key <- read_key_from_file(folder="different/key/location")
##D    creds <- read_credentials_from_file(key=key, fail_if_cant_decrypt=FALSE, showWarnings=FALSE)
##D    ## normally, leave the above flags as their default TRUE. Using FALSE for this example only.
##D  
## End(Not run)




