library(BMS)


### Name: plot.pred.density
### Title: Predictive Densities for bma Objects
### Aliases: plot.pred.density
### Keywords: aplot

### ** Examples

 data(datafls)
 mm=bms(datafls,user.int=FALSE)
 
 #predictive density for two 'new' data points
 pd=pred.density(mm,newdata=datafls[1:2,]) 
 
 
 #plot the density for the second forecast observation
 plot(pd,2)  
 
 #plot the density with realized dep. variable, and no standard errors
 plot(pd, 1, realized.y=0,addons="lzeg") 
 
 
 



