library(fbRads)


### Name: fbad_init
### Title: Initiate Facebook Account with OAuth token
### Aliases: fbad_init

### ** Examples

## Not run: 
##D ## You can generate a token for future use with the help of `httr`, e.g.
##D library(httr)
##D app <- oauth_app("facebook", your_app_id,  your_app_secret)
##D oauth2.0_token(oauth_endpoints("facebook"), app,
##D   scope = '',
##D   type  = "application/x-www-form-urlencoded")$credentials$access_token
##D 
##D ## Then pass this token with your account ID to fbad_init
## End(Not run)



