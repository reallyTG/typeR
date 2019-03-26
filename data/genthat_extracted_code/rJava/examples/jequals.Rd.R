library(rJava)


### Name: jequals
### Title: Comparing Java References
### Aliases: .jequals .jcompare !=,ANY,jobjRef-method
###   !=,jobjRef,jobjRef-method !=,jobjRef,ANY-method ==,ANY,jobjRef-method
###   ==,jobjRef,jobjRef-method ==,jobjRef,ANY-method <,ANY,jobjRef-method
###   <,jobjRef,jobjRef-method <,jobjRef,ANY-method >,ANY,jobjRef-method
###   >,jobjRef,jobjRef-method >,jobjRef,ANY-method <=,ANY,jobjRef-method
###   <=,jobjRef,jobjRef-method <=,jobjRef,ANY-method >=,ANY,jobjRef-method
###   >=,jobjRef,jobjRef-method >=,jobjRef,ANY-method
### Keywords: interface

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)
s <- .jnew("java/lang/String", "foo")
.jequals(s, "foo") # TRUE
.jequals(s, "foo", strict=TRUE) # FALSE - "foo" is not a Java object
t <- s
.jequals(s, t, strict=TRUE) # TRUE

s=="foo" # TRUE

## Don't show: 
 
	stopifnot( 
		.jequals(s, "foo"), 
		!.jequals(s, "foo", strict=TRUE), 
		.jequals(s, t, strict=TRUE), 
		s == "foo"
	)
## End(Don't show)

Double <- J("java.lang.Double")
d1 <- new( Double, 0.0 ) 
d2 <- new( Double, 1.0 )
d3 <- new( Double, 0.0 )

d1 < d2
d1 <= d3
d1 >= d3
d1 > d2

# cannot compare a Double and a String
try( d1 < "foo" )

# but can compare a Double and an Integer
d1 < 10L

## Don't show: 
	stopifnot( 
		d1 < d2       ,
		d1 <= d3      ,
		d1 >= d3      ,
		! (d1 > d2 )  , 
		inherits( try( d1 < "foo", silent = TRUE ), "try-error" ), 
		d1 < 10L )
## End(Don't show)





