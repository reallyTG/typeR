library(coxme)


### Name: lmekin
### Title: Fit a linear mixed effects model
### Aliases: lmekin
### Keywords: models

### ** Examples

  data(ergoStool, package="nlme")  # use a data set from nlme 
  fit1 <- lmekin(effort ~ Type + (1|Subject), data=ergoStool)
  ## Not run: 
##D   # gives the same result
##D   require(nlme)
##D   fit2 <- lme(effort ~ Type, data=ergoStool, random= ~1|Subject,
##D             method="ML")
##D   
## End(Not run) 



