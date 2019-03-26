library(LCAextend)


### Name: init.norm
### Title: computes initial values for the EM algorithm in the case of
###   continuous measurements
### Aliases: init.norm

### ** Examples

#data
data(ped.cont)
status <- ped.cont[,6]
y <- ped.cont[status==2,7:ncol(ped.cont)]
#the function
init.norm(y,K=3)



