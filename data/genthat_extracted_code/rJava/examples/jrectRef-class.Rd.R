library(rJava)


### Name: jrectRef-class
### Title: Rectangular java arrays
### Aliases: jrectRef-class [,jrectRef-method length,jrectRef-method
###   str,jrectRef-method dim,jrectRef-method dim<-,jrectRef-method
###   unique,jrectRef-method duplicated,jrectRef-method
###   anyDuplicated,jrectRef-method sort,jrectRef-method
###   rev,jrectRef-method min,jrectRef-method max,jrectRef-method
###   range,jrectRef-method
### Keywords: classes

### ** Examples

## Don't show: 
# these examples are only unit tests so far
.jinit()
## End(Don't show)
v <- new( J("java.util.Vector") )
v$add( "hello" )
v$add( "world" )
v$add( new( J("java.lang.Double"), "10.2" ) )
array <- v$toArray()

array[ c(TRUE,FALSE,TRUE) ]
array[ 1:2 ]
array[ -3 ]

# length 
length( array )
## Don't show: 
stopifnot(length(array) == 3L)
## End(Don't show)

# also works as a pseudo field as in java
array$length
## Don't show: 
stopifnot(array$length == 3L)
## End(Don't show)


## Don't show: 
# # 2d
dim2d <- c(5L, 2L)

x <- .jcall( "RectangularArrayExamples", "[[Z",
"getBooleanDoubleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE)
stopifnot( identical( typeof( x ), "logical" ) )
stopifnot( identical( dim(x) , dim2d ) )
stopifnot( identical( as.vector(x), rep( c(FALSE,TRUE), 5 ) ) )

x <- .jcall( "RectangularArrayExamples", "[[I",
"getIntDoubleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "integer" ) )
stopifnot( identical( dim(x) , dim2d ) )
stopifnot( identical( as.vector(x), 0:9 ) )
 
x <- .jcall( "RectangularArrayExamples", "[[B",
"getByteDoubleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "raw" ) )
stopifnot( identical( dim(x) , dim2d ) )
stopifnot( identical( as.vector(x), as.raw(0:9) ) )

x <- .jcall( "RectangularArrayExamples", "[[J",
"getLongDoubleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "double" ) )
stopifnot( identical( dim(x) , dim2d ) )
stopifnot( identical( as.vector(x), as.numeric(0:9) ) )

x <- .jcall( "RectangularArrayExamples", "[[S",
"getShortDoubleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "integer" ) )
stopifnot( identical( dim(x) , dim2d ) )
stopifnot( identical( as.vector(x), 0:9 ) )

x <- .jcall( "RectangularArrayExamples", "[[D",
"getDoubleDoubleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "double" ) )
stopifnot( identical( dim(x) , dim2d ) )
stopifnot( identical( as.vector(x), as.numeric(0:9) ) )

x <- .jcall( "RectangularArrayExamples", "[[C",
"getCharDoubleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "integer" ) )
stopifnot( identical( dim(x) , dim2d ) )
stopifnot( identical( as.vector(x), 0:9 ) )

x <- .jcall( "RectangularArrayExamples", "[[F",
"getFloatDoubleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "double" ) )
stopifnot( identical( dim(x) , dim2d ) )
stopifnot( identical( as.vector(x), as.numeric(0:9) ) )

x <- .jcall( "RectangularArrayExamples", "[[Ljava/lang/String;",
"getStringDoubleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "character" ) )
stopifnot( identical( dim(x) , dim2d ) )
stopifnot( identical( as.vector(x), as.character(0:9) ) )


# 3d

dim3d <- c(5L, 3L, 2L) 

x <- .jcall( "RectangularArrayExamples", "[[[Z",
"getBooleanTripleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE)
stopifnot( identical( typeof( x ), "logical" ) )
stopifnot( identical( dim(x) , dim3d ) )
stopifnot( identical( as.vector(x), rep( c(FALSE,TRUE), 15L ) ) )

x <- .jcall( "RectangularArrayExamples", "[[[I",
"getIntTripleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "integer" ) )
stopifnot( identical( dim(x) , dim3d ) )
stopifnot( identical( as.vector(x), 0:29 ) )
 
x <- .jcall( "RectangularArrayExamples", "[[[B",
"getByteTripleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "raw" ) )
stopifnot( identical( dim(x) , dim3d ) )
stopifnot( identical( as.vector(x), as.raw(0:29) ) )

x <- .jcall( "RectangularArrayExamples", "[[[J",
"getLongTripleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "double" ) )
stopifnot( identical( dim(x) , dim3d ) )
stopifnot( identical( as.vector(x), as.numeric(0:29) ) )

x <- .jcall( "RectangularArrayExamples", "[[[S",
"getShortTripleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "integer" ) )
stopifnot( identical( dim(x) , dim3d ) )
stopifnot( identical( as.vector(x), 0:29 ) )

x <- .jcall( "RectangularArrayExamples", "[[[D",
"getDoubleTripleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "double" ) )
stopifnot( identical( dim(x) , dim3d ) )
stopifnot( identical( as.vector(x), as.numeric(0:29) ) )

x <- .jcall( "RectangularArrayExamples", "[[[C",
"getCharTripleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "integer" ) )
stopifnot( identical( dim(x) , dim3d ) )
stopifnot( identical( as.vector(x), 0:29 ) )

x <- .jcall( "RectangularArrayExamples", "[[[F",
"getFloatTripleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "double" ) )
stopifnot( identical( dim(x) , dim3d ) )
stopifnot( identical( as.vector(x), as.numeric(0:29) ) )

x <- .jcall( "RectangularArrayExamples", "[[[Ljava/lang/String;",
"getStringTripleRectangularArrayExample",  evalArray = TRUE, simplify = TRUE )
stopifnot( identical( typeof( x ), "character" ) )
stopifnot( identical( dim(x) , dim3d ) )
stopifnot( identical( as.vector(x), as.character(0:29) ) )
          

# testing the indexing

xj <- .jarray( x, dispatch = TRUE )
stopifnot( dim( xj[ ,, ] ) == c( 5L, 3L, 2L ) )
stopifnot( dim( xj[ ] ) == c( 5L, 3L, 2L ) )
stopifnot( dim( xj[ ,,1,drop= TRUE] ) == c( 5L, 3L ) )
stopifnot( dim( xj[ ,,1,drop= FALSE] ) == c( 5L, 3L, 1L ) )
stopifnot( dim( xj[ ,1,,drop= TRUE] ) == c( 5L, 2L ) )
stopifnot( dim( xj[ ,1,,drop= FALSE] ) == c( 5L, 1L, 2L ) )
stopifnot( dim( xj[ 1,,,drop= TRUE] ) == c( 3L, 2L ) )
stopifnot( dim( xj[ 1,,,drop= FALSE] ) == c( 1L, 3L, 2L ) )
stopifnot( dim( xj[ ,1,1,drop= TRUE] ) == c( 5L ) )
stopifnot( dim( xj[ ,1,1,drop= FALSE] ) == c( 5L, 1L, 1L ) )
stopifnot( dim( xj[ 1,1,1,drop= TRUE] ) == c( 1L ) )
stopifnot( dim( xj[ 1,1,1,drop= FALSE] ) == c( 1L, 1L, 1L ) )

# testing simplify
stopifnot( identical( xj[simplify=TRUE], x) )
stopifnot( identical( xj[,1,,simplify=TRUE], x[,1,]) )
stopifnot( identical( xj[,1,-1,simplify=TRUE], x[,1,-1]) )
stopifnot( identical( xj[4,1,c(TRUE,FALSE),simplify=TRUE], x[4,1,c(TRUE,FALSE)]) )
stopifnot( identical( xj[1:10,simplify=TRUE], x[1:10]) )

# test dim<-
dim( xj ) <- c( 15L, 2L )
stopifnot( xj@jsig == "[[Ljava/lang/String;" )
stopifnot( dim( xj ) == c(15L, 2L ) )

dim( xj ) <- NULL
stopifnot( xj@jsig == "[Ljava/lang/String;" )
stopifnot( dim( xj ) == 30L )

# test unique
# **** FIXME: this should really work even with dispatch=FALSE since
#             it's a vector but it does not! It applies to everything
#             below
x <- .jarray( rep( 1:2, each = 5 ), dispatch = TRUE )
xu <- unique( x )
stopifnot( dim(xu) == 2L )

  p1 <- .jnew( "java/awt/Point" )
  p2 <- .jnew( "java/awt/Point" )
  x <- .jarray( list( p1, p2 ), dispatch = TRUE )
  xu <- unique( x )
  stopifnot( dim( xu ) == 1L )

# test duplicated
x <- .jarray( rep( 1:2, each = 5 ), dispatch = TRUE )
xd <- duplicated( x )
stopifnot( xd == rep( c( FALSE, TRUE, TRUE, TRUE, TRUE), 2L ) ) 
if (rJava:::.base.has.anyDuplicated) stopifnot( anyDuplicated( x ) == 2L )

  p1 <- .jnew( "java/awt/Point" )
  p2 <- .jnew( "java/awt/Point" )
  x <- .jarray( list( p1, p2 ), dispatch = TRUE )
  xd <- duplicated( x )
  stopifnot( xd == c( FALSE, TRUE) )
  if (rJava:::.base.has.anyDuplicated) stopifnot( anyDuplicated( x ) == 2L )

# test sort, rev
d1 <- .jnew("java/lang/Double", 0)
d2 <- .jnew("java/lang/Double", -1)
a <- .jarray( list( d1, d2), dispatch = TRUE )
stopifnot( sort( a )[[1]]$doubleValue() == -1.0 )
stopifnot( rev( a )[[1]]$doubleValue() == -1.0 )

# test min, max, range
Double <- J("java.lang.Double")
a <- .jarray( list( new( Double, 10 ), new( Double, 4), new( Double, 5)
), "java/lang/Double", dispatch = TRUE )
stopifnot( min( a )$doubleValue() == 4  )
stopifnot( max( a )$doubleValue() == 10 )
stopifnot( range(a)[[1]]$doubleValue() == 4 )
stopifnot( range(a)[[2]]$doubleValue() == 10)

## End(Don't show)



