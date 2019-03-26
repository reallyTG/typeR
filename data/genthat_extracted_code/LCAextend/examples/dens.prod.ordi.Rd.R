library(LCAextend)


### Name: dens.prod.ordi
### Title: computes the probability of a given discrete measurement vector
###   for all classes under a product of multinomial
### Aliases: dens.prod.ordi

### ** Examples

#data
data(ped.ordi)
status <- ped.ordi[,6]
y <- ped.ordi[status==2,7:ncol(ped.ordi)]
#param
data(param.ordi)
#the function applied for measurement of the first individual in the ped.ordi
dens.prod.ordi(y.x=y[1,],param.ordi)



