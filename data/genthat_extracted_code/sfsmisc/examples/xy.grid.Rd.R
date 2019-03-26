library(sfsmisc)


### Name: xy.grid
### Title: Produce regular grid matrix.
### Aliases: xy.grid
### Keywords: array

### ** Examples

plot(xy.grid(1:7, 10*(0:4)))

x <- 1:3 ;  y <- 10*(0:4)
xyg <- xy.grid(x,y)

## Compare with expand.grid() :
m2 <- as.matrix(expand.grid(y,x)[, 2:1])
dimnames(m2) <- NULL
stopifnot(identical(xyg, m2))



