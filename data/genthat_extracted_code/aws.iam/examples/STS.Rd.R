library(aws.iam)


### Name: get_session_token
### Title: Temporary Session Tokens
### Aliases: get_session_token get_federation_token get_caller_identity
###   assume_role delete_saved_credentials restore_credentials

### ** Examples

## Not run: 
##D get_caller_identity() # check current identity
##D get_session_token() # get token but do not use
##D 
##D x <- get_session_token(use = TRUE) # use temp token
##D get_caller_identity() # check that token is in use
##D 
##D restore_credentials() # return to original credentials
##D get_caller_identity() # check identity, again
## End(Not run)



