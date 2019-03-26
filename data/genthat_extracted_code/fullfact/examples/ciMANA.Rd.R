library(fullfact)


### Name: ciMANA
### Title: Bootstrap confidence intervals
### Aliases: ciMANA

### ** Examples


#Import bootstrap resampled data model results
data(chinook_bootL) #Chinook salmon offspring length

#Extract un-corrected confidence interval
ciMANA(comp=chinook_bootL)

#Extract bias corrected confidence interval
ciMANA(comp=chinook_bootL,bias=c(0.0000000,0.7192253,0.2029684))
#see details for 'bias' fail

#Extract bias and accelerated corrected confidence interval
#Import jackknife resampled data model results
data(chinook_jackL)
#
ciMANA(comp=chinook_bootL,bias=c(0.0000000,0.7192253,0.2029684),accel=chinook_jackL)
#see details for 'bias' fail



