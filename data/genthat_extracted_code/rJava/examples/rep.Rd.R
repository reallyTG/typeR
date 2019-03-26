library(rJava)


### Name: rep
### Title: Creates java arrays by cloning
### Aliases: rep,jarrayRef-method rep,jobjRef-method rep,jrectRef-method

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)
if (!nzchar(Sys.getenv("NOAWT"))) {
  p <- .jnew( "java.awt.Point" )
  a <- rep( p, 10 )

  stopifnot( dim(a) == c(10L ) )
  a[[1]]$move( 10L, 50L )
  stopifnot( a[[2]]$getX() == 0.0 )
}



