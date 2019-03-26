library(phtt)


### Name: Simulated Data for the KSS-Model: DGP1
### Title: Simulated Panel-Data Set with Polynomial Factor Structure and
###   _exogenous_ regressors.
### Aliases: DGP1
### Keywords: datasets

### ** Examples

data(DGP1)

## Dimensions
N    <- 60
T    <- 30

## Observed Variables
Y    <- matrix(DGP1$Y,  nrow=T,ncol=N)
X1   <- matrix(DGP1$X1, nrow=T,ncol=N)
X2   <- matrix(DGP1$X2, nrow=T,ncol=N)

## Unobserved common factors
CF.1 <- DGP1$CF.1[1:T]
CF.2 <- DGP1$CF.2[1:T]
CF.3 <- DGP1$CF.3[1:T]

## Take a look at the simulated data set DGP1:
par(mfrow=c(2,2))
matplot(Y,  type="l", xlab="Time", ylab="", main="Depend Variable")
matplot(X1, type="l", xlab="Time", ylab="", main="First Regressor")
matplot(X2, type="l", xlab="Time", ylab="", main="Second Regressor")
## Usually unobserved common factors:
matplot(matrix(c(CF.1,
                 CF.2,
                 CF.3), nrow=T,ncol=3),
        type="l", xlab="Time", ylab="", main="Unobserved Common Factors")
par(mfrow=c(1,1))

## Estimation:
KSS.fit      <-KSS(Y~-1+X1+X2)
(KSS.fit.sum <-summary(KSS.fit))

plot(KSS.fit.sum)



