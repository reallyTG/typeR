library(gk)


### Name: dgk
### Title: g-and-k distribution functions
### Aliases: dgk pgk g-and-k qgk rgk

### ** Examples

p = 1:9/10 ##Some probabilities
x = qgk(seq(0.1,0.9,0.1), A=3, B=1, g=2, k=0.5) ##g-and-k quantiles
rgk(5, A=3, B=1, g=2, k=0.5) ##g-and-k draws
dgk(x, A=3, B=1, g=2, k=0.5) ##Densities of x under g-and-k
dgk(x, A=3, B=1, g=2, k=0.5, log=TRUE) ##Log densities of x under g-and-k
pgk(x, A=3, B=1, g=2, k=0.5) ##Distribution function of x under g-and-k



