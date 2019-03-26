library(kntnr)


### Name: kntn_auth
### Title: Authorization Header for 'kintone'
### Aliases: kntn_auth kntn_get_authorization_header kntn_set_auth
###   kntn_unset_auth

### ** Examples

## Not run: 
##D # set KNTN_URL, KNTN_AUTH and KNTN_AUTH_TYPE interactively.
##D # By default, auth_type is password.
##D kntn_set_auth()
##D 
##D Sys.getenv(c("KNTN_URL", "KNTN_AUTH", "KNTN_AUTH_TYPE"))
##D 
##D # This will return `X-Cybozu-Authorization` header.
##D kntn_get_authorization_header()
##D 
##D # Clear environmental variables before trying to use another set of authorization info.
##D kntn_unset_auth()
##D kntn_set_auth(auth_type = "token")
##D 
##D # This will return `X-Cybozu-API-Token` header.
##D kntn_get_authorization_header()
##D 
##D # To avoid interaction, set these environmental variables manually.
##D Sys.setenv("KNTN_URL" = "https://example.cybozu.com/")
##D Sys.setenv("KNTN_AUTH" = "abcdefg")
##D Sys.setenv("KNTN_AUTH_TYPE" = "token")
## End(Not run)



