library(LCAextend)


### Name: init.ordi
### Title: computes the initial values for EM algorithm in the case of
###   ordinal measurements
### Aliases: init.ordi

### ** Examples

#data
data(ped.ordi)
status <- ped.ordi[,6]
y <- ped.ordi[,7:ncol(ped.ordi)]
#the function
init.ordi(y[status==2,],K=3)



