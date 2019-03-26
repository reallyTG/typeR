library(rJython)


### Name: jython.method.call
### Title: jython.method.call
### Aliases: jython.method.call
### Keywords: manip

### ** Examples


rJython <- rJython()

rJython$exec( 'a = "hola hola"' )
jython.method.call( rJython, "a", "split", " " )




