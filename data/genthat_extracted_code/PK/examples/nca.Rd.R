library(PK)


### Name: nca
### Title: Estimation of various PK parameters
### Aliases: nca nca.ssd nca.batch nca.complete
### Keywords: htest

### ** Examples

#### serial sampling designs
## example for a serial sampling data design from Wolfsegger and Jaki (2009)
conc <- c(0, 0, 0, 2.01, 2.85, 2.43, 0.85, 1.00, 0.91, 0.46, 0.35, 0.63, 0.39, 0.32, 
          0.45, 0.11, 0.18, 0.19, 0.08, 0.09, 0.06)
time <- c(rep(0,3), rep(5/60,3), rep(3,3), rep(6,3), rep(9,3), rep(16,3), rep(24,3))

# Direct call of the function
# CAUTION: this might take a few minutes
# Note: 1E4 bootstrap replications were used in the example given 
# in Wolfsegger and Jaki (2009)
set.seed(34534)
nca.ssd(conc=conc, time=time, n.tail=4, dose=200, method=c("z","boott"), 
         conf.level=0.95, nsample=500)

# Call through the wrapper function using data
data <- data.frame(conc=conc, time=time)
nca(data=data, n.tail=4, dose=200, method="z", 
     conf.level=0.95, design="ssd")



#### batch design:
## a batch design example from Holder et al. (1999).
data(Rats)
data <- subset(Rats,Rats$dose==100)

# using the wrapper function
nca(data=data, n.tail=4, dose=100, method="z", 
     conf.level=0.95, design="batch")
# direct call
nca.batch(data=data, n.tail=4, dose=100, method="z", 
     conf.level=0.95)

## example with overlapping batches (Treatment A in Example of Jaki & Wolfsegger 2012)
conc <- list(batch1=c(0,0,0,0, 69.7,37.2,213,64.1,  167,306,799,406, 602,758,987,627,
                      1023,1124,1301,880, 1388,1374,1756,1120, 1481,1129,1665,1598,
                      1346,1043,1529,1481, 658,576,772,851, 336,325,461,492, 
                      84,75.9,82.6,116),
             batch2=c(0,0,0, 29.2,55.9,112.2, 145,153,169, 282,420,532, 727,1033,759, 
                      1360,1388,1425, 1939,1279,1318, 1614,1205,1542, 1238,1113,1386,
                      648,770,786, 392,438,511, 77.3,90.1,97.9))
time <- list(batch1=rep(c(0,0.5,0.75,1,1.5,2,3,4,8,12,24),each=4),
             batch2=rep(c(0,0.25,0.5,0.75,1,1.5,2,3,4,8,12,24),each=3))

nca.batch(conc,time,method="z",n.tail=4,dose=80)


#### complete data design
## example from Gibaldi and Perrier (1982, page 436) for individual PK parameters
time <- c(0, 0.165, 0.5, 1, 1.5, 3, 5, 7.5, 10)
conc <- c(0, 65.03, 28.69, 10.04, 4.93, 2.29, 1.36, 0.71, 0.38)
# using the wrapper function
nca(conc=conc, time=time, n.tail=3, dose=1E6, design="complete")
# direct call
nca.complete(conc=conc, time=time, n.tail=3, dose=1E6)



