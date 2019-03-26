library(fullfact)


### Name: resampFamily
### Title: Bootstrap resample within families
### Aliases: resampFamily

### ** Examples

data(chinook_length) #Chinook salmon offspring length
#resampFamily(dat=chinook_length,copy=c(3:8),family="family",iter=1000)
resampFamily(dat=chinook_length,copy=c(3:8),family="family",iter=2)
#example with a couple iterations



