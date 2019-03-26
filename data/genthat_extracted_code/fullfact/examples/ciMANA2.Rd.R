library(fullfact)


### Name: ciMANA2
### Title: Bootstrap confidence intervals 2
### Aliases: ciMANA2

### ** Examples


#Import bootstrap resampled data model results
data(chinook_bootL) #Chinook salmon offspring length

#Extract un-corrected confidence interval
ciMANA2(comp=chinook_bootL,position="tray")

#Extract bias corrected confidence interval
ciMANA2(comp=chinook_bootL,bias=c(0.0000000,0.7192253,0.2029684,0.1077423),position="tray")
#see details for 'bias' fail

#Extract bias and accelerated corrected confidence interval
#Import jackknife resampled data model results
data(chinook_jackL)
#
ciMANA2(comp=chinook_bootL,bias=c(0.0000000,0.7192253,0.2029684,0.1077423),
accel=chinook_jackL,position="tray")
#see details for 'bias' fail



