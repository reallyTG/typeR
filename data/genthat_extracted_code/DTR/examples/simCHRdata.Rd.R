library(DTR)


### Name: simCHRdata
### Title: Function to simulate data from sequentially randomized clinical
###   trials (Tang and Wahed 2013 [Epub ahead of print])
### Aliases: simCHRdata
### Keywords: survival analysis sequentially randomized clinical trial
###   sequentially randomized design treatment sequence dynamic treatment
###   regime adaptive treatment strategy Inverse weighting

### ** Examples


#-------Example function usage-----------
n <- 200
max.c <- 5
pi.x <- 0.5
pi.r <- 0.6
pi.z <- 0.5
gamma10 <- 1
gamma11 <- 1.5
gamma12 <- 1.2
gamma20 <- 1
gamma21 <- 1.5
gamma22 <- 1.3
alpha10 <- 0.5
alpha11 <- 0.2
alpha12 <- 0.1
alpha20 <- 0.5
alpha21 <- 0.2
alpha22 <- 0.05
beta <- c(0.5, 0.5)

set.seed(123)
CHRdata <- simCHRdata(n,max.c,pi.x,pi.r,
pi.z,gamma10,gamma11,gamma12,gamma20,gamma21,
gamma22,alpha10,alpha11,alpha12,alpha20,alpha21,
alpha22,beta)



