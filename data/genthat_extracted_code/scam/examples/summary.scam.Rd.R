library(scam)


### Name: summary.scam
### Title: Summary for a SCAM fit
### Aliases: summary.scam print.summary.scam
### Keywords: models smooth regression

### ** Examples

 ## Not run: 
##D ## simulating data...
##D n <- 200
##D set.seed(1)
##D x1 <- runif(n)*6-3
##D f1 <- 3*exp(-x1^2) # unconstrained smooth term
##D x2 <- runif(n)*4-1;
##D f2 <- exp(4*x2)/(1+exp(4*x2)) # monotone increasing smooth
##D x3 <- runif(n)*5;
##D f3 <- -log(x3)/5  # monotone decreasing smooth
##D f <- f1+f2+f3
##D y <- f + rnorm(n)*0.3
##D dat <- data.frame(x1=x1,x2=x2,x3=x3,y=y)
##D ## fit model ...
##D b <- scam(y~s(x1,k=15,bs="cr",m=2)+s(x2,k=30,bs="mpi",m=2)+s(x3,k=30,bs="mpd",m=2),
##D      data=dat)
##D 
##D summary(b)
##D plot(b,pages=1)  
##D  
## End(Not run)  



