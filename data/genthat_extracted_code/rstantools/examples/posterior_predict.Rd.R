library(rstantools)


### Name: posterior_predict
### Title: Generic function for drawing from the posterior predictive
###   distribution
### Aliases: posterior_predict

### ** Examples

# Example using rstanarm package:
# posterior_predict method for 'stanreg' objects
## No test: 
if (require("rstanarm")) {
  fit <- stan_glm(mpg ~ wt + am, data = mtcars)
  yrep <- posterior_predict(fit)
  all.equal(ncol(yrep), nobs(fit))

  nd <- data.frame(wt = mean(mtcars$wt), am = c(0, 1))
  ytilde <- posterior_predict(fit, newdata = nd)
  all.equal(ncol(ytilde), nrow(nd))
}
## End(No test)

# Also see help("posterior_predict", package = "rstanarm")




