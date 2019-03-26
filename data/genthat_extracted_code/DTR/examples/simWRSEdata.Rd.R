library(DTR)


### Name: simWRSEdata
### Title: Function to simulate data from sequentially randomized clinical
###   trials (Guo and Tsiatis 2005)
### Aliases: simWRSEdata
### Keywords: survival analysis sequentially randomized clinical trial
###   sequentially randomized design treatment sequence dynamic treatment
###   regime adaptive treatment strategy Inverse weighting

### ** Examples

 
#-------Example function usage-----------
n <- 100
max.c <- 3.5*365 
pi.r <- 0.5 
pi.z <- 0.5 
mean.T0 <- 182.5 
mean.TR <- 365 
mean.T1 <- 365 
mean.T2 <- 547.5

# Generate full data from SRD
set.seed(123)
data.A1 <- simWRSEdata(n,max.c,pi.r,pi.z,
mean.T0,mean.TR,mean.T1,mean.T2)
data.A2 <- simWRSEdata(n,max.c,pi.r,pi.z,
mean.T0,mean.TR,mean.T1,mean.T2)
WRSEdata <- cbind(X=c(rep(0,n), rep(1,n)), 
rbind(data.A1, data.A2)) # X=0 for A1; X=1 for A2



