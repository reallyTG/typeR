library(mixPHM)


### Name: phmclust
### Title: Fits mixtures of proportional hazard models
### Aliases: phmclust summary.mws print.mws logLik.mws
### Keywords: models

### ** Examples


data(webshop)

## Fitting a Weibll mixture model (3 components) is fitted with classification EM 
## Observations above 600sec are regarded as censored

res1 <- phmclust(webshop, K = 3, cutpoint = 600)
res1
summary(res1)

## Fitting a Rayleigh Weibull proportional hazard model (2 components, proportional over groups)
res2 <- phmclust(webshop, K = 2, method = "main.p", Sdist = "rayleigh") 
res2
summary(res2)




