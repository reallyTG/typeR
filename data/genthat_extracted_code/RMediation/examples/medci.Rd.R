library(RMediation)


### Name: medci
### Title: Confidence Interval for the Mediated Effect
### Aliases: medci
### Keywords: distribution regression

### ** Examples

##produces CI using PRODCLIN and density plot of distribution of xy
(res <- medci(mu.x=.2, mu.y=.4, se.x=1, se.y=1, rho=0, alpha=.05,
  type="prodclin", plot=TRUE, plotCI=TRUE) )
  
  ## To get a vector of CI estimates
  res[[1]]
  ## To get the point estimate of the indirect effect
    res[["Estimate"]] # Estimate
  ## To get the SE of the indirect effect
    res[["SE"]] # SE  




