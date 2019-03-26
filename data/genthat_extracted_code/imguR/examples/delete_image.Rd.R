library(imguR)


### Name: delete_image
### Title: Delete image
### Aliases: delete_image

### ** Examples

## Not run: 
##D # using a deletehash, anonymously
##D u <- upload_image('file.png')
##D delete_image(u$deletehash)
##D 
##D # using an OAuth token
##D tkn <- imgur_login()
##D u <- upload_image('file.png', token = tkn)
##D delete_image(u, token = tkn)
## End(Not run)



