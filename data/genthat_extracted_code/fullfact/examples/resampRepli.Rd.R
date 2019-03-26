library(fullfact)


### Name: resampRepli
### Title: Bootstrap resample within replicates
### Aliases: resampRepli

### ** Examples

data(chinook_length) #Chinook salmon offspring length
#resampRepli(dat=chinook_length,copy=c(3:8),family="family",replicate="repli",iter=1000)
resampRepli(dat=chinook_length,copy=c(3:8),family="family",replicate="repli",iter=2)
#example with a couple iterations



