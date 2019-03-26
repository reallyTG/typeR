library(gensphere)


### Name: gensphere
### Title: Generalized spherical distribution definition, density,
###   simulation
### Aliases: gensphere dgensphere rgensphere

### ** Examples


# define a diamond shaped contour
cfunc1 <- cfunc.new(d=2)
#cfunc1 <- cfunc.add.term( cfunc1,"lp.norm",k=c(1,1))
cfunc1 <- cfunc.add.term( cfunc1,"gen.lp.norm",k=c(1,1,2,0,0,1))
cfunc1 <- cfunc.finish( cfunc1 )
cfunc1

## No test: 
# define a generalized spherical distribution
rradial <- function( n ) { rgamma( n, shape=2 ) }
dradial <- function( x ) { dgamma( x, shape=2 ) }
dist1 <- gensphere( cfunc1, dradial, rradial, g0=cfunc1$norm.const ) 
dist1

# calculate density at a few points
dgensphere( x=matrix( c(0,0, 0,1, 0,2), nrow=2, ncol=3), dist1 )

# calculate and plot density surface on a grid
xy.grid <- seq(-3,3,.1)
z <- gs.pdf2d.plot( dist1, xy.grid )
title3d("density surface")

# simulate values from the distribution
x <- rgensphere( 10000, dist1 )
plot(t(x),xlab="x",ylab="y",main="simulated points")

## End(No test)



