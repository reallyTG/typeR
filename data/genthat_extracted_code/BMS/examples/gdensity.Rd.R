library(BMS)


### Name: gdensity
### Title: Posterior Density of the Shrinkage Factor
### Aliases: gdensity
### Keywords: aplot utilities

### ** Examples


 data(datafls)
 mm=bms(datafls,g="hyper=UIP")

 gdensity(mm) # default plotting
 
 # the grey bars represent expected shrinkage factors of the individual models
 gdensity(mm,addons="lzfes") 
 
 # #plotting the median 'm' and the posterior mean and bounds based on MCMC results:
 gdensity(mm,addons="zSEm",addons.lwd=2)

# plot the posterior shrinkage density only for the very best model
 gdensity(mm[1],addons="esz")


#using the calculated density for other purposes...
 dd=gdensity(mm,plot=FALSE)
 plot(dd) 




