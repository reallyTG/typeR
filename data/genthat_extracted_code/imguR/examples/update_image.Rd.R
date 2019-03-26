library(imguR)


### Name: update_image
### Title: Update image
### Aliases: update_image

### ** Examples

## Not run: 
##D # using a deletehash, anonymously
##D u <- upload_image('file.png')
##D update_image(u$deletehash, title = 'New Title')
##D 
##D # using an OAuth token
##D tkn <- imgur_login()
##D u <- upload_image('file.png', token = tkn)
##D update_image(u, title = 'New Title', token = tkn)
## End(Not run)



