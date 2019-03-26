library(rJython)


### Name: rJython
### Title: rJython
### Aliases: rJython
### Keywords: symbolmath

### ** Examples


rJython <- rJython()

# Now you can use the rJava low level interface

rJython$exec( "a = 2*2" )
four <- rJython$get("a")
.jstrVal( four )

# Alternatively, a higher level interface is provided by the rJython package:

a <- 1:4
jython.assign( rJython, "a", a )
jython.exec( rJython, "b = len( a )" )
jython.get( rJython, "b" )


## Not run: 
##D 
##D # If package 'foo' contains python code that depends on module 'mod',
##D #   'mod' can be included in the 'inst' directory of the package.
##D # Then, in order to make it available to Jython, the interpreter can be
##D #   started as follows:
##D 
##D rJython <- rJython( modules = system.file("python-modules", package = "foo") )
##D 
## End(Not run)



