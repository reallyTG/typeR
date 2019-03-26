library(HRQoL)


### Name: BIreg
### Title: Fit a binomial logistic regression model
### Aliases: BIreg
### Keywords: HRQoL

### ** Examples

  set.seed(1234)
  # We simulate a covariable and construct the outcome variable applying
  # an inverse logit link function on it.
  
  m <- 10                       
  k <-100                       
  covariate <- rnorm(k,2,0.5)  
  
  beta <- c(-6,4)
  p <- 1/(1+exp(-(beta[1]+beta[2]*covariate)))
  
  # without dispersion parameter
  outcome <- rBI(k,m,p)
  model <- BIreg(outcome~covariate,m,disp=FALSE)
  model
  
  # with dispersion parameter
  phi <- 2
  outcome.disp <- rBI(k,m,p,phi)
  model.disp <- BIreg(outcome.disp~covariate,m,disp=TRUE)
  model.disp



