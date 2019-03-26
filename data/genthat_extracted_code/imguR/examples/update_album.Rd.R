library(imguR)


### Name: update_album
### Title: Update album
### Aliases: update_album

### ** Examples

## Not run: 
##D # update using a deletehash, anonymously
##D i <- imgur()
##D hist(rnorm(20))
##D img <- imgur_off(i)
##D a1 <-
##D create_album(id = img,
##D              title = 'My first Imgur album',
##D              description = 'A simple album',
##D              privacy = 'hidden',
##D              layout = 'grid',
##D              cover_id = img)
##D update_album(a1$deletehash, title = 'My second Imgur album')
##D 
##D # update using an OAuth token
##D tkn <- imgur_login()
##D a2 <-
##D create_album(id = img,
##D              title = 'My first Imgur album',
##D              description = 'A simple album',
##D              privacy = 'hidden',
##D              layout = 'grid',
##D              cover_id = img,
##D              token = tkn)
##D update_album(a2, title = 'My second Imgur album')
## End(Not run)



