library(verification)


### Name: rcrv
### Title: Reduced centered random variable
### Aliases: rcrv

### ** Examples


data(precip.ensemble) 
#Observations are in the column
obs<-precip.ensemble[,3] 

#Forecast values of ensemble are in the column 4 to 54
eps<-precip.ensemble[,4:54]   

#Means and variances of the ensemble
mean<-apply(eps,1,mean)
var<-apply(eps,1,var)

#observation error of 0.5mm 
sig0 <- 0.5 

rcrv(obs,mean,var,sig0)




