library(rPython)


### Name: python.exec
### Title: python.exec
### Aliases: python.exec
### Keywords: manip

### ** Examples


a <- 1:4
b <- 5:8
python.exec( c( "def concat(a,b):", "\treturn a+b" ) )
python.call( "concat", a, b)





