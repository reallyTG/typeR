library(rJython)


### Name: jython.call
### Title: jython.call
### Aliases: jython.call
### Keywords: manip

### ** Examples


rJython <- rJython()
jython.call( rJython, "len", 1:3 )

a <- 1:4
b <- 5:8
rJython$exec( "def concat(a,b): return a+b" )
jython.call( rJython, "concat", a, b)





