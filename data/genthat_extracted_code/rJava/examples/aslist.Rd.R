library(rJava)


### Name: aslist
### Title: Converts java objects or arrays to R lists
### Aliases: as.list.jobjRef as.list.jarrayRef as.list.jrectRef
### Keywords: programming

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)
  # lapplying over a java array
  a <- .jarray( list( 
	.jnew( "java/awt/Point", 10L, 10L ), 
	.jnew( "java/awt/Point", 30L, 30L )
  ) )
  lapply( a, function(point){ 
	with(point, { 
		(x + y ) ^ 2
	} )
  } )

# lapply over a Vector (implements Iterable)
v <- .jnew("java/util/Vector")
v$add( "foo" )
v$add( .jnew("java/lang/Double", 10.2 ) )
sapply( v, function(item) item$getClass()$getName() )




