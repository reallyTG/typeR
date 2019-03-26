library(imguR)


### Name: create_comment
### Title: Create a comments
### Aliases: create_comment

### ** Examples

## Not run: 
##D tkn <- imgur_login()
##D 
##D # comment on an image
##D cmt <- create_comment("vSXfU46", "This is a test comment", token = tkn)
##D 
##D # create a reply comment
##D create_comment("vSXfU46", "This is a test comment", parent = cmt, token = tkn)
## End(Not run)



