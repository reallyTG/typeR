library(npsp)


### Name: spersp
### Title: Perspective plot with a color scale
### Aliases: spersp spersp.data.grid spersp.default
### Keywords: hplot

### ** Examples


#
# Regularly spaced 2D data
nx <- c(40, 40) # ndata =  prod(nx)
x1 <- seq(-1, 1, length.out = nx[1])
x2 <- seq(-1, 1, length.out = nx[2])
trend <- outer(x1, x2, function(x,y) x^2 - y^2) 
spersp( x1, x2, trend, main = 'Trend', zlab = 'y')

#
# Multiple plots 
set.seed(1)
y <- trend + rnorm(prod(nx), 0, 0.1)
x <- as.matrix(expand.grid(x1 = x1, x2 = x2)) # two-dimensional grid
# local polynomial kernel regression
lp <- locpol(x, y, nbin = nx, h =  diag(c(0.3, 0.3)))
# 1x2 plot
old.par <- par(mfrow = c(1,2))
spersp( x1, x2, y, main = 'Data')
spersp(lp, main = 'Estimated trend', zlab = 'y')
par(old.par)



