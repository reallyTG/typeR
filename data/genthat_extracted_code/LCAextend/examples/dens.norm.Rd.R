library(LCAextend)


### Name: dens.norm
### Title: computes the multinormal density of a given continuous
###   measurement vector for all classes
### Aliases: dens.norm

### ** Examples

#data
data(ped.cont)
status <- ped.cont[,6]
y <- ped.cont[status==2,7:ncol(ped.cont)]
#param
data(param.cont)
#the function applied for measurement of the first individual in the ped.ordi
dens.norm(y.x=y[1,],param.cont)



