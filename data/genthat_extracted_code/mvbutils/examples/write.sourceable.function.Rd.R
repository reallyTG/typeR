library(mvbutils)


### Name: write.sourceable.function
### Title: Sourceable code for functions (and more) with flat-format
###   documentation
### Aliases: write.sourceable.function
### Keywords: internal

### ** Examples

## Not run: 
##D write.sourceable.function( write.sourceable.function, "wsf.r")
##D # To dump all functions and their documentation in a workspace into a single sourceable file:
##D cat( "", file="allfuns.r")
##D sapply( find.funs(), write.sourceable.function, file="allfuns.r", append=TRUE, print.name=TRUE)
##D # A non-function
##D scrunge <- c( 1:7, 11)
##D attr( scrunge, "source") <- c( "# Another way:", "c( 1:4, c( 5:7, 11))")
##D scrunge # [1] 1 2 3 4 5 6 7 11
##D write.sourceable.function( scrunge, stdout()) # source
##D fixr( scrunge) # source
## End(Not run)



