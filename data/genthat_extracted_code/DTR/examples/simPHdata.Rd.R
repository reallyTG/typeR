library(DTR)


### Name: simPHdata
### Title: Function to simulate data from sequentially randomized clinical
###   trials (Tang and Wahed 2011)
### Aliases: simPHdata
### Keywords: survival analysis sequentially randomized clinical trial
###   sequentially randomized design treatment sequence dynamic treatment
###   regime adaptive treatment strategy Inverse weighting

### ** Examples


#-------Example function usage-----------
n <- 400
pi.x <- 0.5
pi.z <- 0.5
lambda <- 1/4
alpha <- 1/6
beta1 <- -0.5
beta2 <- -0.8
beta3 <- 0.5
beta4 <- 1
beta5 <- -1
gamma <- -0.5
max.c <- 14

set.seed(123)
PHdata <- simPHdata(n,max.c,pi.x,pi.z,lambda,alpha,
beta1,beta2,beta3,beta4,beta5,gamma)



