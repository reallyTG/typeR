library(ctsem)


### Name: ctStanGenerateData
### Title: Add a $generated object to ctstanfit object, with random data
###   generated from posterior of ctstanfit object
### Aliases: ctStanGenerateData

### ** Examples

gen <- ctStanGenerateData(ctstantestfit)
plot(gen$generated$Y[3,,2],type='l') #Third random data sample, 2nd manifest var, all time points. 



