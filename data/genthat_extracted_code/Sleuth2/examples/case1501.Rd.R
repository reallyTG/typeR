library(Sleuth2)


### Name: case1501
### Title: Logging and Water Quality
### Aliases: case1501
### Keywords: datasets

### ** Examples

str(case1501)

par(mfrow=c(2,1)) # Make 2 plots on one page
plot(Nocut ~ Week, case1501)
plot(Patch ~ Week, case1501)
par(mfrow=c(1,1))
lag.plot(case1501$Nocut,do.lines=FALSE) 
lag.plot(case1501$Patch,do.lines=FALSE)

# Compute pooled estimate of first autocorrelation coefficient
# First auto covariance, Nocut
ac1nocut <- acf(case1501$Nocut,lag.max=1,type="covariance",plot=FALSE)$acf[2] 
n <- length(case1501$Nocut)
# Zeroth autocovariance for Nocut
ac0nocut <- var(case1501$Nocut[2:n])*(n-2)/(n-1)
# First auto covariance, Patch
ac1patch <- acf(case1501$Patch,lag.max=1,type="covariance",plot=FALSE)$acf[2]
# Zeroth autocovariance for PATCH
ac0patch <- var(case1501$Patch [2:n])*(n-2)/(n-1)

ac1pool <- (ac1nocut + ac1patch)/2
ac0pool <- (ac0nocut + ac0patch)/2

acorr1 <- ac1pool/ac0pool
acorr1  # Pooled estimate of first lag serial coefficient



