library(rJython)


### Name: jython.exec
### Title: jython.exec
### Aliases: jython.exec
### Keywords: manip

### ** Examples


rJython <- rJython()

a <- 1:4
b <- 5:8
jython.exec( rJython, c( "def concat(a,b):", "\treturn a+b" ) )
jython.call( rJython, "concat", a, b)





