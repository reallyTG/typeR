library(np)


### Name: npuniden.boundary
### Title: Kernel Bounded Univariate Density Estimation Via Boundary Kernel
###   Functions
### Aliases: npuniden.boundary
### Keywords: nonparametric smooth

### ** Examples

## Not run: 
##D ## Example 1: f(0)=0, f(1)=1, plot boundary corrected density,
##D ## unadjusted density, and DGP
##D set.seed(42)
##D n <- 100
##D X <- sort(rbeta(n,5,1))
##D dgp <- dbeta(X,5,1)
##D model.g1 <- npuniden.boundary(X,kertype="gaussian1")
##D model.g2 <- npuniden.boundary(X,kertype="gaussian2")
##D model.b1 <- npuniden.boundary(X,kertype="beta1")
##D model.b2 <- npuniden.boundary(X,kertype="beta2")
##D model.fb <- npuniden.boundary(X,kertype="fb")
##D model.unadjusted <- npuniden.boundary(X,a=-Inf,b=Inf)
##D ylim <- c(0,max(c(dgp,model.g1$f,model.g2$f,model.b1$f,model.b2$f,model.fb$f)))
##D plot(X,dgp,ylab="Density",ylim=ylim,type="l")
##D lines(X,model.g1$f,lty=2,col=2)
##D lines(X,model.g2$f,lty=3,col=3)
##D lines(X,model.b1$f,lty=4,col=4)
##D lines(X,model.b2$f,lty=5,col=5)
##D lines(X,model.fb$f,lty=6,col=6)
##D lines(X,model.unadjusted$f,lty=7,col=7)
##D rug(X)
##D legend("topleft",c("DGP",
##D                    "Boundary Kernel (gaussian1)",
##D                    "Boundary Kernel (gaussian2)",
##D                    "Boundary Kernel (beta1)",
##D                    "Boundary Kernel (beta2)",
##D                    "Boundary Kernel (floating boundary)",
##D                    "Unadjusted"),col=1:7,lty=1:7,bty="n")
##D 
##D ## Example 2: f(0)=0, f(1)=0, plot density, distribution, DGP, and
##D ## asymptotic point-wise confidence intervals
##D set.seed(42)
##D X <- sort(rbeta(100,5,3))
##D model <- npuniden.boundary(X)
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
##D ## Example 3: Age for working age males in the cps71 data set bounded
##D ## below by 21 and above by 65
##D data(cps71)
##D attach(cps71)
##D model <- npuniden.boundary(age,a=21,b=65)
##D par(mfrow=c(1,1))
##D hist(age,prob=TRUE,main="")
##D lines(age,model$f)
##D lines(density(age,bw=model$h),col=2)
##D legend("topright",c("Boundary Kernel","Unadjusted"),lty=c(1,1),col=1:2,bty="n")
##D detach(cps71)
## End(Not run) 



