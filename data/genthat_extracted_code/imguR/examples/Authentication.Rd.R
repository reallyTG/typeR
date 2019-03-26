library(imguR)


### Name: Authentication
### Title: Imgur API Authentication
### Aliases: Authentication

### ** Examples

## Not run: 
##D # OAuth2.0-authenticated use
##D 
##D # interactive OAuth login
##D tkn <- imgur_login()
##D 
##D # upload a simple graph
##D i <- imgur(token = tkn)
##D hist(rnorm(100))
##D u <- imgur_off(i)
##D 
##D # pass the `imgur_image` object to `update_image`:
##D update_image(u, title = 'My graph', description = 'A simple graph', token = tkn)
##D 
##D # or, pass just the image id:
##D update_image(u$id, title = 'My graph', description = 'A simple graph', token = tkn)
##D 
##D # periodically refresh token
##D tkn$refresh()
## End(Not run)

## Not run: 
##D # anonymous use
##D 
##D # upload a simple graph
##D i <- imgur()
##D hist(rnorm(100))
##D u <- imgur_off(i)
##D 
##D # pass just the image deletehash:
##D update_image(u$deletehash, title = 'My graph', description = 'A simple graph')
## End(Not run)




