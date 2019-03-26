library(epitools)


### Name: probratio
### Title: Obtain unbiased probability ratios from logistic regression
###   models
### Aliases: probratio
### Keywords: models risk

### ** Examples

  set.seed(123)
  x <- rnorm(500)
  y <- rbinom(500, 1, exp(-1 + .3*x))
  logreg <- glm(y ~ x, family=binomial)
  confint.default(logreg) ## 95% CI over-estimates the 0.3 log-RR
  pr1 <- probratio(logreg, method='ML', scale='log', start=c(log(mean(y)), 0)) 
  
  ## generally more efficient to calculate log-RR then exponentiate for non-symmetric 95% CI
  pr1 <- probratio(logreg, scale='log', method='delta')
  pr2 <- probratio(logreg, scale='linear', method='delta')
  exp(pr1[, 5:6])
  pr2[, 5:6]



