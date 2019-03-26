library(HRQoL)


### Name: print.summary.BIreg
### Title: Print a summary.BIreg class model.
### Aliases: print.summary.BIreg

### ** Examples

  set.seed(1234)
  # We simulate a covariable and construct the outcome variable applying
  # an inverse logit link function on it.
  
  m <- 10                       
  k <-100                       
  covariate <- rnorm(k,2,0.5)  
  
  beta <- c(-6,4)
  p <- 1/(1+exp(-(beta[1]+beta[2]*covariate)))
  outcome <- rBI(k,m,p)
  
  model <- BIreg(outcome~covariate,m,disp=FALSE)
  sum.model <- summary(model)
  print(sum.model) # or just sum.model
  


