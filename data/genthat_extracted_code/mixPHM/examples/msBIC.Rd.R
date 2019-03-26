library(mixPHM)


### Name: msBIC
### Title: PHM model selection with BIC
### Aliases: msBIC print.msBIC
### Keywords: models

### ** Examples


##Fitting 3 Weibull proportional hazard models (over groups, pages) for K=2,3 components
data(webshop)
res <- msBIC(webshop, K = c(2,3), method = c("main.p","main.g"), maxiter = 10)
res 



