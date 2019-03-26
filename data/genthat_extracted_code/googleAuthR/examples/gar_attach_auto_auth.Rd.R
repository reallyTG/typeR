library(googleAuthR)


### Name: gar_attach_auto_auth
### Title: Auto Authentication function for use within .onAttach
### Aliases: gar_attach_auto_auth

### ** Examples


## Not run: 
##D 
##D .onAttach <- function(libname, pkgname){
##D 
##D   googleAuthR::gar_attach_auto_auth("https://www.googleapis.com/auth/urlshortener", "US_AUTH_FILE")
##D 
##D }
##D 
##D ## will only work if you have US_AUTH_FILE environment variable pointing to an auth file location
##D ## .Renviron example
##D US_AUTH_FILE="/home/mark/auth/urlshortnerauth.json"
##D 
## End(Not run)




