library(rJython)


### Name: jython.assign
### Title: Assign and get variables in Python from R
### Aliases: jython.assign jython.get
### Keywords: manip

### ** Examples


rJython <- rJython()

a <- 1:4
jython.assign( rJython, "a", a )
jython.exec( rJython, "b = len( a )" )
jython.get( rJython, "b" )

rJython$exec( "import math" )
jython.get( rJython, "math.pi" )




