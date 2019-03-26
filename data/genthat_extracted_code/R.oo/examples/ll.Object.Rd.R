library(R.oo)


### Name: ll.Object
### Title: Generates a list of informative properties of all members of an
###   Object
### Aliases: ll.Object Object.ll ll,Object-method
### Keywords: programming methods internal methods

### ** Examples

  obj <- Object()
  obj$x <- 1:100
  obj$y <- 100:1
  ll(obj)

  ## Not run: 
##D   gives:
##D 
##D     member data.class dimension objectSize
##D   1      x    numeric       100        424
##D   2      y    numeric       100        424
##D   
## End(Not run)



