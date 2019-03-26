library(sirt)


### Name: pbivnorm2
### Title: Cumulative Function for the Bivariate Normal Distribution
### Aliases: pbivnorm2
### Keywords: Bivariate normal distribution

### ** Examples

library(pbivnorm)
# define input
x <- c(0, 0,  .5, 1, 1  )
y <- c( 0, -.5,  1, 3, .5 )
rho <- c( .2, .8, -.4, .6, .5 )
# compare pbivnorm2 and pbivnorm functions
pbiv2 <- sirt::pbivnorm2( x=x, y=y, rho=rho )
pbiv <- pbivnorm::pbivnorm(  x,  y, rho=rho )
max( abs(pbiv-pbiv2))
  ## [1] 0.0030626
round( cbind( x, y, rho,pbiv, pbiv2 ), 4 )
  ##          x    y  rho   pbiv  pbiv2
  ##   [1,] 0.0  0.0  0.2 0.2820 0.2821
  ##   [2,] 0.0 -0.5  0.8 0.2778 0.2747
  ##   [3,] 0.5  1.0 -0.4 0.5514 0.5514
  ##   [4,] 1.0  3.0  0.6 0.8412 0.8412
  ##   [5,] 1.0  0.5  0.5 0.6303 0.6304



