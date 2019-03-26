library(rPython)


### Name: python.call
### Title: python.call
### Aliases: python.call python.method.call
### Keywords: manip

### ** Examples

python.call( "len", 1:3 )
a <- 1:4
b <- 5:8
python.exec( "def concat(a,b): return a+b" )
python.call( "concat", a, b)

python.assign( "a",  "hola hola" )
python.method.call( "a", "split", " " )

## simplification of arguments
a <- 1
b <- 5:8

## Not run: 
##D python.call("concat", a, b)
## End(Not run)

# using function I()
python.call("concat", I(a), b)

# setting as.is = TRUE
python.call("concat", a, b, as.is = TRUE)




