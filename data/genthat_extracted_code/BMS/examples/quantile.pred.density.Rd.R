library(BMS)


### Name: quantile.pred.density
### Title: Extract Quantiles from 'density' Objects
### Aliases: quantile.pred.density quantile.coef.density quantile.density
### Keywords: utilities

### ** Examples

 data(datafls)
 mm = bms(datafls[1:70,], user.int=FALSE)
 
 #predict last two observations with preceding 70 obs:
 pmm = pred.density(mm, newdata=datafls[71:72,], plot=FALSE) 
 #'standard error' quantiles
 quantile(pmm, c(.05, .95))
 
 #Posterior density for Coefficient of "GDP60"
 cmm = density(mm, reg="GDP60", plot=FALSE) 
 quantile(cmm, probs=c(.05, .95))
 
 
 #application to generic density:
 dd1 = density(rnorm(1000))
 quantile(dd1)
 
 #application to list of densities:
 quantile.density( list(density(rnorm(1000)), density(rnorm(1000))) )



