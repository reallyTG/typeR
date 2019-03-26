library(dCovTS)


### Name: UnivTest
### Title: Testing for independence in univariate time series
### Aliases: UnivTest
### Keywords: htest

### ** Examples

x<-rnorm(100)
n <- length(x)
c <- 1
lambda <- 1/5
p <- ceiling(c*n^lambda)
## Not run: 
##D mW=UnivTest(x,type="bar",testType="covariance",p=p,b=499,parallel=TRUE,bootMethod="Wild")
##D mI=UnivTest(x,type="bar",testType="covariance",p=p,b=499,parallel=TRUE,bootMethod="Indep")
## End(Not run)

data <- tail(ibmSp500[,2],100)
n2 <- length(data)
c2 <- 3
lambda2 <- 0.1
p2 <- ceiling(c2*n2^lambda2)
## Not run: 
##D testCov=UnivTest(data,type="par",testType="covariance",p=p2,b=499,parallel=TRUE)
##D testCor=UnivTest(data,type="par",testType="correlation",p=p2,b=499,parallel=TRUE)
## End(Not run)



