library(mixPHM)


### Name: screeBIC
### Title: Scree plot of BIC's
### Aliases: screeBIC
### Keywords: hplot

### ** Examples


##Fitting all Weibull proportional hazard models for K=2,3,4 components
data(webshop)
res <- msBIC(webshop, K = c(2,3,4), method = "all", maxiter = 5)
screeBIC(res)



