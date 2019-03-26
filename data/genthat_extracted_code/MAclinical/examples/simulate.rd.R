library(MAclinical)


### Name: simulate
### Title: Simulating data
### Aliases: simuldata_list simuldatacluster_list
### Keywords: htest

### ** Examples

# load MAclinical library
# library(MAclinical)

# Generating 3 simulated data sets
my.data<-simuldata_list(niter=3,n=100,p=150,psig=10,q=5,muX=2,muZ=1)
length(my.data)
dim(my.data[[1]]$x)
dim(my.data[[1]]$z)
length(my.data[[1]]$y)




