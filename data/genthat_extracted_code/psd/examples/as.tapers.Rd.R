library(psd)


### Name: as.tapers
### Title: Coerce an object into a "tapers" object.
### Aliases: as.tapers tapers

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Objects with class 'tapers'
##D ##
##D is.tapers(as.tapers(1))
##D is.tapers(as.tapers(1:10))
##D 
##D # note dimensions
##D as.tapers(matrix(1:10,ncol=1))
##D as.tapers(list(x=1:10,y=1:30))
##D as.tapers( x <- data.frame(x=1:10,y=10:19) )
##D 
##D # change constraints
##D as.tapers(x, min_taper=3, max_taper=10)
##D 
##D # class 'character' is in-coercible; raise error
##D try(as.tapers(c("a","b")), silent=TRUE)
##D 
## End(Not run)#REX



