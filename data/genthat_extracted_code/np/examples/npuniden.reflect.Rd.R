library(np)


### Name: npuniden.reflect
### Title: Kernel Bounded Univariate Density Estimation Via Data-Reflection
### Aliases: npuniden.reflect
### Keywords: nonparametric smooth

### ** Examples

## Not run: 
##D ## Example 1: f(0)=0, f(1)=1, plot boundary corrected density,
##D ## unadjusted density, and DGP
##D set.seed(42)
##D n <- 100
##D X <- sort(rbeta(n,5,1))
##D dgp <- dbeta(X,5,1)
##D model <- npuniden.reflect(X)
##D model.unadjusted <- npuniden.boundary(X,a=-Inf,b=Inf)
##D ylim <- c(0,max(c(dgp,model$f,model.unadjusted$f)))
##D plot(X,model$f,ylab="Density",ylim=ylim,type="l")
##D lines(X,model.unadjusted$f,lty=2,col=2)
##D lines(X,dgp,lty=3,col=3)
##D rug(X)
##D legend("topleft",c("Data-Reflection","Unadjusted","DGP"),col=1:3,lty=1:3,bty="n")
##D 
##D ## Example 2: f(0)=0, f(1)=0, plot density, distribution, DGP, and
##D ## asymptotic point-wise confidence intervals
##D set.seed(42)
##D X <- sort(rbeta(100,5,3))
##D model <- npuniden.reflect(X)
##D par(mfrow=c(1,2))
##D ylim=range(c(model$f,model$f+1.96*model$sd.f,model$f-1.96*model$sd.f,dbeta(X,5,3)))
##D plot(X,model$f,ylim=ylim,ylab="Density",type="l",)
##D lines(X,model$f+1.96*model$sd.f,lty=2)
##D lines(X,model$f-1.96*model$sd.f,lty=2)
##D lines(X,dbeta(X,5,3),col=2)
##D rug(X)
##D legend("topleft",c("Density","DGP"),lty=c(1,1),col=1:2,bty="n")
##D 
##D plot(X,model$F,ylab="Distribution",type="l")
##D lines(X,model$F+1.96*model$sd.F,lty=2)
##D lines(X,model$F-1.96*model$sd.F,lty=2)
##D lines(X,pbeta(X,5,3),col=2)
##D rug(X)
##D legend("topleft",c("Distribution","DGP"),lty=c(1,1),col=1:2,bty="n")
##D 
##D 
##D ## Example 3: Age for working age males in the cps71 data set bounded
##D ## below by 21 and above by 65
##D data(cps71)
##D attach(cps71)
##D model <- npuniden.reflect(age,a=21,b=65)
##D par(mfrow=c(1,1))
##D hist(age,prob=TRUE,main="",ylim=c(0,max(model$f)))
##D lines(age,model$f)
##D lines(density(age,bw=model$h),col=2)
##D legend("topright",c("Data-Reflection","Unadjusted"),lty=c(1,1),col=1:2,bty="n")
##D detach(cps71)
## End(Not run) 



