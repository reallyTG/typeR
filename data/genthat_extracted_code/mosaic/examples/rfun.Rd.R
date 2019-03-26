library(mosaic)


### Name: rfun
### Title: Generate a natural-looking function
### Aliases: rfun rpoly2
### Keywords: random

### ** Examples

f <- rfun( ~ u & v)
plotFun(f(u,v)~u&v,u=range(-5,5),v=range(-5,5))
myfun <- rfun(~ u & v, seed=1959)
g <- rpoly2( ~ x&y&z, seed=1964)
plotFun(g(x,y,z=2)~x&y,xlim=range(-5,5),ylim=range(-5,5))



