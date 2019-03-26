library(BMS)


### Name: pred.density
### Title: Predictive Densities for bma Objects
### Aliases: pred.density pred.density-class print.pred.density
### Keywords: utilities

### ** Examples

 data(datafls)
 mm=bms(datafls,user.int=FALSE)
 
 #predictive densityfor two 'new' data points
 pd=pred.density(mm,newdata=datafls[1:2,]) 
 
 
 #fitted values based on best models, same as predict(mm, exact=TRUE)
 pd$fit
 
 #plot the density for the first forecast observation
 plot(pd,1)  
 
 # the same plot ' naked'
 plot(pd$densities()[[1]])
 
 
 #predict density for the first forecast observation if the dep. variable is 0
 pd$dyf(0,1) 
 
 #predict densities for both forecasts for the realizations 0 and 0.5
 pd$dyf(rbind(c(0,.5),c(0,.5)))
 
 # calc. Log Predictive Score if both forecasts are realized at 0:
 lps.bma(pd,c(0,0))
 
 



