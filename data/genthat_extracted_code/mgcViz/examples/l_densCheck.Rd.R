library(mgcViz)


### Name: l_densCheck
### Title: Checking residuals conditional density
### Aliases: l_densCheck

### ** Examples

library(mgcViz);
# Dataset where variance increases linearly with x2, for x2 > 0.2
n <- 1e3
x1 <- rnorm(1e3)
x2 <- rnorm(1e3)
dat <- data.frame("x1"=x1, 
                  "x2"=x2, "y"=sin(x1) + 0.5*x2^2 + pmax(x2, 0.2)*rnorm(n))
b <- gam(y ~ s(x1)+s(x2), data=dat)
b <- getViz(b)

# (Red) Blue indicates area where the empirical density 
# of the residuals is (lower) higher than it should be under 
# the model (residuals should be N(0, sigma) here).
# Here there are clear signs of heteroscedasticity: 
# the conditional variance is is increasing for x2 > 0.2. 
check1D(b, "x2", type = "tnormal") + l_densCheck() + l_rug()

# Suppose we want to compare the conditional density of the standardized residuals
# not with a Gaussian, but with a Student-t density with 3 degree of freedom.
# We could achieve this as follows:
myDistance <- function(.ed, .gr, .y){
  d <- dt(.gr / sd(.y), df = 3)
  d <- abs( sqrt(.ed) - sqrt(d) ) # We are using absolute difference between sqrt-densities 
}

check1D(b, "x2", type = "response") + l_densCheck(dFun = myDistance) + l_rug()
# NB comparing with a Student density is not useful for this example, but it illustrates
# how both the distance function and the reference density can be customized.




