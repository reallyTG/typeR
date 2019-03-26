library(twitteR)


### Name: use_oauth_token
### Title: Sets up the OAuth credentials for a twitteR session from an
###   existing Token object
### Aliases: use_oauth_token
### Keywords: interface

### ** Examples

 ## Not run: 
##D     library(httr)
##D     library(twitteR)
##D     token <- Token2.0$new(
##D       params = list(as_header=TRUE),
##D       app = oauth_app("fun.with.twitter", "no.key", "no.secret"),
##D       endpoint = oauth_endpoints("twitter"),
##D       credentials = list(access_token = "AAAAAAAAAAAAAAAAAAA%3DAAAAAAAAAAAAAA"),
##D       cache = FALSE
##D     )
##D 
##D     use_oauth_token(token)
##D   
## End(Not run)



