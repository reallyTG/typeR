library(ic.infer)


### Name: or.relimp
### Title: Function to calculate relative importance for order-restricted
###   linear models
### Aliases: or.relimp or.relimp.lm or.relimp.default all.R2
### Keywords: models regression multivariate

### ** Examples

covswiss <- cov(swiss)
## all R2-values for restricted linear model with restrictions that
## Catholic and Infant.Mortality have non-negative coefficients
R2s <- all.R2(covswiss, ui=rbind(c(0,0,0,1,0),c(0,0,0,0,1)))
R2s

require(kappalab) ## directly using package kappalab
Shapley.value(set.func(R2s))  

### with convenience wrapper from this package
or.relimp(covswiss, ui=rbind(c(0,0,0,1,0),c(0,0,0,0,1)))

### also works on linear models
limo <- lm(swiss)
#or.relimp(limo, ui=rbind(c(0,0,0,1,0),c(0,0,0,0,1)))

## same model using index vector
or.relimp(limo, ui=rbind(c(1,0),c(0,1)), index=5:6)




