library(DTR)


### Name: simLDTdata
### Title: Function to simulate data from sequentially randomized clinical
###   trials (Lunceford, Davidian and Tsiatis 2002)
### Aliases: simLDTdata
### Keywords: survival analysis sequentially randomized clinical trial
###   sequentially randomized design treatment sequence dynamic treatment
###   regime adaptive treatment strategy Inverse weighting

### ** Examples

 
#-------Example function usage-----------
n <- 100
L <- 1.5
max.c <- 2.5
pi.r <- 0.5
pi.z <- 0.5
lambda <- 1.33
alpha <- 6.67
beta1 <- 0.29
beta2 <- -0.67

# Generate data from SRD
set.seed(123)
data.A1 <- simLDTdata(n,max.c,pi.r,pi.z,
lambda,alpha,beta1,beta2,L)
data.A2 <- simLDTdata(n,max.c,pi.r,pi.z,
lambda,alpha,beta1,beta2,L)
LDTdata <- cbind(X=c(rep(0,n), rep(1,n)), 
rbind(data.A1, data.A2)) # X=0 for A1; X=1 for A2




