library(rJava)


### Name: .jinstanceof
### Title: Is a java object an instance of a given java class
### Aliases: %instanceof% .jinstanceof
### Keywords: interface

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)
Double <- J("java.lang.Double")
d <- new( Double, "10.2" )

# character
d %instanceof% "java.lang.Double"
d %instanceof% "java.lang.Number"

# jclassName
d %instanceof% Double

# instance of Class
Double.class <- Double@jobj
d %instanceof% Double.class

# other object
other.double <- new( Double, 10.2 )
d %instanceof% other.double

## Don't show: 
stopifnot( d %instanceof% "java.lang.Double" )
stopifnot( d %instanceof% "java.lang.Number" )
stopifnot( d %instanceof% "java.lang.Object" )
stopifnot( d %instanceof% Double.class )
stopifnot( d %instanceof% other.double )
stopifnot( d %instanceof% Double )
## End(Don't show)




