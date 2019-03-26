library(rJava)


### Name: clone
### Title: Object cloner
### Aliases: clone clone,jobjRef-method clone,jarrayRef-method
###   clone,jrectRef-method
### Keywords: programming

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)

  p1 <- .jnew("java/awt/Point" )
  p2 <- clone( p1 )
  p2$move( 10L, 10L )
  p1$getX() 

  # check that p1 and p2 are not references to the same java object
  stopifnot( p1$getX() == 0 )
  stopifnot( p2$getX() == 10 )




