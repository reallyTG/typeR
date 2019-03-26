library(pim)


### Name: estimators
### Title: Estimator functions for probabilistic index models
### Aliases: estimators estimator.nleqslv estimator.glm estimator.glm
###   estimator.BB

### ** Examples

# This is a reimplementation of the identity link
myconstruct <- function(x,y,link){
  # this function is returned
 function(beta){
   xb <- as.vector(x %*% beta)
   colSums(x * (y - xb))
  }
}

data(ChickWeight)
themodel <- pim(weight ~ Diet, data = ChickWeight,
construct = myconstruct)

# compare coefficients to 
themodel2 <- pim(weight ~ Diet, data = ChickWeight,
                link = "identity")
coef(themodel)
coef(themodel2)

# Note that this example uses a wrong estimate for the variance-covariance matrix
# You have to specify the correct vcov estimator as well



