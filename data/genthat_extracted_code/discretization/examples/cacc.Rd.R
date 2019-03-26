library(discretization)


### Name: cacc
### Title: Auxiliary function for CACC discretization algorithm
### Aliases: cacc

### ** Examples


#----Calculating cacc value (Tsai, Lee, and Yang (2008))
a=c(3,0,3,0,6,0,0,3,0)
m=matrix(a,ncol=3,byrow=TRUE)
cacc(m)



