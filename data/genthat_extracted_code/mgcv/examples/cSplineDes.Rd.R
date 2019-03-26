library(mgcv)


### Name: cSplineDes
### Title: Evaluate cyclic B spline basis
### Aliases: cSplineDes
### Keywords: models smooth regression

### ** Examples

 require(mgcv)
 ## create some x's and knots...
 n <- 200
 x <- 0:(n-1)/(n-1);k<- 0:5/5
 X <- cSplineDes(x,k) ## cyclic spline design matrix
 ## plot evaluated basis functions...
 plot(x,X[,1],type="l"); for (i in 2:5) lines(x,X[,i],col=i)
 ## check that the ends match up....
 ee <- X[1,]-X[n,];ee 
 tol <- .Machine$double.eps^.75
 if (all.equal(ee,ee*0,tolerance=tol)!=TRUE) 
   stop("cyclic spline ends don't match!")
 
 ## similar with uneven data spacing...
 x <- sort(runif(n)) + 1 ## sorting just makes end checking easy
 k <- seq(min(x),max(x),length=8) ## create knots
 X <- cSplineDes(x,k) ## get cyclic spline model matrix  
 plot(x,X[,1],type="l"); for (i in 2:ncol(X)) lines(x,X[,i],col=i)
 ee <- X[1,]-X[n,];ee ## do ends match??
 tol <- .Machine$double.eps^.75
 if (all.equal(ee,ee*0,tolerance=tol)!=TRUE) 
   stop("cyclic spline ends don't match!")



