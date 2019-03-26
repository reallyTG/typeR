library(extracat)


### Name: approx.dcor
### Title: Distance Correlation Approximation
### Aliases: approx.dcor

### ** Examples

## Not run: 
##D 
##D # The straightforward way of approximating the distance correlation fails:
##D # for instance the computation of dcor for a random sample with 4000 observations
##D # takes pretty long but drawing samples of 500, 1000 or even 2000 observations
##D # leads to relatively big errors.
##D # The approximation via approx.dcor is very fast and for 
##D # n = 50 or n=100 the results are very close to the truth
##D 
##D require(energy)
##D x<- rnorm(4000,mean=10,sd=3)
##D y <- rnorm(1,sd=0.01)*(x-10)^3 + rnorm(1,sd=0.1)*(x-10)^2
##D  + rnorm(1)*(x-10)+rnorm(4000,sd=4)
##D 
##D system.time(dd <- dcor(x,y))
##D system.time(dd0 <- wdcor(x,y))[[3]]
##D dd - dd0
##D 
##D 
##D system.time(da100 <- approx.dcor(x,y,100))[[3]]
##D da100-dd0
##D 	
##D # For a smaller sample size we can try out how good the approximation really is:
##D test<-replicate(100,{
##D N <- 1000
##D x<- rnorm(N,mean=10,sd=3)
##D y <- rnorm(1,sd=0.01)*(x-10)^3 + rnorm(1,sd=0.1)*(x-10)^2 
##D y <- y + rnorm(1)*(x-10)+rnorm(N,sd=4)
##D 
##D dd <- wdcor(x,y)
##D dd25 <- approx.dcor(x,y,25)
##D dd50 <- approx.dcor(x,y,50)
##D dd100 <- approx.dcor(x,y,100)
##D dd75 <- approx.dcor(x,y,75)
##D 
##D dd25c <- approx.dcor(x,y,25,correct = TRUE)
##D dd50c <- approx.dcor(x,y,50,correct = TRUE)
##D dd100c <- approx.dcor(x,y,100,correct = TRUE)
##D dd75c <- approx.dcor(x,y,75,correct = TRUE)
##D c(2*dd, dd25, dd50, dd75, dd100, dd25c, dd50c, dd75c, dd100c)-dd
##D })
##D 
##D rm<-apply(test,1,mean)
##D 
##D plot( seq(25,100,25), rm[2:5],type="l",
##D  ylim= c(min(rm),abs(min(rm))), xlab = "No. of bins per axis",ylab = "error")
##D points( seq(25,100,25), rm[2:5],pch=19)
##D points( seq(25,100,25), rm[6:9],type="l", col=2)
##D points( seq(25,100,25), rm[6:9],pch=19,col=2)	
##D abline(h=0,lwd=3)
##D legend( 25,abs(min(rm)),legend=c("raw value after binning","corrected value"),
##D col=1:2,lwd=3)
## End(Not run)



