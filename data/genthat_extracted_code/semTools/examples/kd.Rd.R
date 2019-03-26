library(semTools)


### Name: kd
### Title: Generate data via the Kaiser-Dickman (1962) algorithm.
### Aliases: kd

### ** Examples


#### First Example

## Get data
dat <- HolzingerSwineford1939[ , 7:15]
hs.n <- nrow(dat)

## Covariance matrix divided by n
hscov <- ((hs.n-1)/hs.n) * cov(dat)

## Generate new, raw data corresponding to hscov
newdat <- kd(hscov, hs.n)

## Difference between new covariance matrix and hscov is minimal
newcov <- (hs.n-1)/hs.n * cov(newdat)
summary(as.numeric(hscov - newcov))

## Generate sample data, treating hscov as population matrix
newdat2 <- kd(hscov, hs.n, type = "sample")

#### Another example

## Define a covariance matrix
covmat <- matrix(0, 3, 3)
diag(covmat) <- 1.5
covmat[2:3,1] <- c(1.3, 1.7)
covmat[3,2] <- 2.1
covmat <- covmat + t(covmat)

## Generate data of size 300 that have this covariance matrix
rawdat <- kd(covmat, 300)

## Covariances are exact if we compute sample covariance matrix by
## dividing by n (vs by n - 1)
summary(as.numeric((299/300)*cov(rawdat) - covmat))

## Generate data of size 300 where covmat is the population covariance matrix
rawdat2 <- kd(covmat, 300)




