library(fullfact)


### Name: ciMANA3
### Title: Bootstrap confidence intervals 3
### Aliases: ciMANA3

### ** Examples


#Import bootstrap resampled data model results
data(chinook_bootL) #Chinook salmon offspring length

#Extract un-corrected confidence interval
ciMANA3(comp=chinook_bootL,remain=c("tray","Residual"))

#Extract bias corrected confidence interval
ciMANA3(comp=chinook_bootL,bias=c(0.0000000,0.7192253,0.2029684,0.1077423,0.5499255),
remain=c("tray","Residual"))
#see details for 'bias' fail

#Extract bias and accelerated corrected confidence interval
#Import jackknife resampled data model results
data(chinook_jackL)
#
ciMANA3(comp=chinook_bootL,bias=c(0.0000000,0.7192253,0.2029684,0.1077423,0.5499255),
accel=chinook_jackL,remain=c("tray","Residual"))



