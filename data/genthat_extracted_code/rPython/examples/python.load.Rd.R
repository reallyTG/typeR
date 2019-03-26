library(rPython)


### Name: python.load
### Title: python.load
### Aliases: python.load
### Keywords: manip

### ** Examples


a <- 1:4
b <- 5:8

# this file contains the definition of function concat
python.load( system.file( "concat.py", package = "rPython" ) )
python.call( "concat", a, b)




