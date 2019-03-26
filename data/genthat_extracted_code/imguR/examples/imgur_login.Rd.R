library(imguR)


### Name: imgur_login
### Title: Login to Imgur
### Aliases: imgur_login

### ** Examples

## Not run: 
##D # login interactively
##D tkn <- imgur_login()
##D # use token in the `imgur` device
##D i <- imgur('png', token = tkn)
##D hist(rnorm(20))
##D imgur_off(i)
##D 
##D # reload previous token
##D rm(tkn)
##D # OAuth token is automatically stored by 
##D # `imgur_login` if `cache = TRUE` (the default)
##D # It is reloaded by calling `imgur_login`
##D tkn <- imgur_login()
##D token$refresh() # refresh token
## End(Not run)



