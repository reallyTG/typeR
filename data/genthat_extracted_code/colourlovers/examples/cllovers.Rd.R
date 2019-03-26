library(colourlovers)


### Name: cllovers
### Title: Retrieve a user (lover)
### Aliases: cllover cllovers print.cllover print.cllovers

### ** Examples

e <- function(e) NULL # function for tryCatch to fail in examples

# retrieve top users
tryCatch( cllovers(set='top', fmt='json'), error = e)

# retrieve a single user
tryCatch( cllover('COLOURlovers', fmt='json'), error = e)



