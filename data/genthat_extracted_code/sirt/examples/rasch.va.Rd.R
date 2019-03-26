library(sirt)


### Name: rasch.va
### Title: Estimation of the Rasch Model with Variational Approximation
### Aliases: rasch.va
### Keywords: Variational approximation

### ** Examples

#############################################################################
# EXAMPLE 1: Rasch model
#############################################################################
set.seed(8706)
N <- 5000
I <- 20
dat <- sirt::sim.raschtype( stats::rnorm(N,sd=1.3), b=seq(-2,2,len=I) )

# estimation via variational approximation
mod1 <- sirt::rasch.va(dat)

# estimation via marginal maximum likelihood
mod2 <- sirt::rasch.mml2(dat)

# estmation via joint maximum likelihood
mod3 <- sirt::rasch.jml(dat)

# compare sigma
round( c( mod1$sig, mod2$sd.trait ), 3 )
## [1] 1.222 1.314

# compare b
round( cbind( mod1$item$b, mod2$item$b, mod3$item$itemdiff), 3 )
##         [,1]   [,2]   [,3]
##  [1,] -1.898 -1.967 -2.090
##  [2,] -1.776 -1.841 -1.954
##  [3,] -1.561 -1.618 -1.715
##  [4,] -1.326 -1.375 -1.455
##  [5,] -1.121 -1.163 -1.228



