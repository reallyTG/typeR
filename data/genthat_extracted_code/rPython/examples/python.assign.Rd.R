library(rPython)


### Name: python.assign
### Title: Assign and get variables in Python from R
### Aliases: python.assign python.get
### Keywords: manip

### ** Examples


a <- 1:4
python.assign( "a", a )
python.exec( "b = len( a )" )
python.get( "b" )

python.exec( "import math" )
python.get( "math.pi" )




