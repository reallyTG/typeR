library(DTR)


### Name: simLRdata
### Title: Function to simulate data from sequentially randomized clinical
###   trials (Kidwell and Wahed 2013)
### Aliases: simLRdata
### Keywords: survival analysis sequentially randomized clinical trial
###   sequentially randomized design treatment sequence dynamic treatment
###   regime adaptive treatment strategy Inverse weighting

### ** Examples

 
#-------Example function usage-----------
n <- 100
max.c <- 12 # 30% censoring
pi.x <- 0.5
pi.r <- 0.6 # 60% response rate
pi.z <- 0.5
mean.NR.1 <- 1
mean.NR.2 <- 1
mean.R.1 <- 1
mean.R.2 <- 1
mean.RE.11 <- 5
mean.RE.12 <- 5
mean.RE.21 <- 5
mean.RE.22 <- 5

set.seed(123)
LRdata <- simLRdata(n,max.c,pi.x,pi.r,
pi.z,mean.NR.1,mean.NR.2,mean.R.1,mean.R.2,
mean.RE.11,mean.RE.12,mean.RE.21,mean.RE.22)



