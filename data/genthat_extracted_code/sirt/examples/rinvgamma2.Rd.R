library(sirt)


### Name: rinvgamma2
### Title: Inverse Gamma Distribution in Prior Sample Size Parameterization
### Aliases: rinvgamma2 dinvgamma2

### ** Examples

#############################################################################
# EXAMPLE 1: Inverse gamma distribution
#############################################################################

# prior sample size of 100 and prior variance of 1.5
n0 <- 100
var0 <- 1.5

# 100 random draws
y1 <- sirt::rinvgamma2( n=100, n0, var0 )
summary(y1)
graphics::hist(y1)

# density y at grid x
x <- seq( 0, 2, len=100 )
y <- sirt::dinvgamma2( x, n0, var0 )
graphics::plot( x, y, type="l")



