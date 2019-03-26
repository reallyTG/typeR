library(grattan)


### Name: prohibit_vector_recycling
### Title: Prohibit vector recycling
### Aliases: prohibit_vector_recycling prohibit_vector_recycling.MAXLENGTH
###   prohibit_arg_recycling.MAXLENGTH

### ** Examples

## Not run: 
##D # Returns nothing because they are of the same length
##D prohibit_vector_recycling(c(2, 2), c(2, 2))
##D # Returns nothing also, because the only different length is 1
##D prohibit_vector_recycling(c(2, 2), 1)
##D # Returns an error:
##D prohibit_vector_recycling(c(2, 2), 1, c(3, 3, 3))
## End(Not run)



