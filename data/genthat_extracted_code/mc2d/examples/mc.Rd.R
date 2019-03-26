library(mc2d)


### Name: mc
### Title: Monte Carlo Object
### Aliases: mc
### Keywords: methods

### ** Examples

 
x <- mcstoc(runif)
y <- mcdata(3, type="0")
z <- x * y
(m <- mc(x, y, z, name=c('n1', 'n2', 'n3')))
mc(m, x, devname=TRUE)



