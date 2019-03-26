library(crs)


### Name: crsiv
### Title: Nonparametric Instrumental Regression
### Aliases: crsiv
### Keywords: instrument

### ** Examples

## Not run: 
##D ## This illustration was made possible by Samuele Centorrino
##D ## <samuele.centorrino@univ-tlse1.fr>
##D 
##D set.seed(42)
##D n <- 1500
##D 
##D ## The DGP is as follows:
##D 
##D ## 1) y = phi(z) + u
##D 
##D ## 2) E(u|z) != 0 (endogeneity present)
##D 
##D ## 3) Suppose there exists an instrument w such that z = f(w) + v and
##D ## E(u|w) = 0
##D 
##D ## 4) We generate v, w, and generate u such that u and z are
##D ## correlated. To achieve this we express u as a function of v (i.e. u =
##D ## gamma v + eps)
##D 
##D v <- rnorm(n,mean=0,sd=0.27)
##D eps <- rnorm(n,mean=0,sd=0.05)
##D u <- -0.5*v + eps
##D w <- rnorm(n,mean=0,sd=1)
##D 
##D ## In Darolles et al (2011) there exist two DGPs. The first is
##D ## phi(z)=z^2 and the second is phi(z)=exp(-abs(z)) (which is
##D ## discontinuous and has a kink at zero).
##D 
##D fun1 <- function(z) { z^2 }
##D fun2 <- function(z) { exp(-abs(z)) }
##D 
##D z <- 0.2*w + v
##D 
##D ## Generate two y vectors for each function.
##D 
##D y1 <- fun1(z) + u
##D y2 <- fun2(z) + u
##D 
##D ## You set y to be either y1 or y2 (ditto for phi) depending on which
##D ## DGP you are considering:
##D 
##D y <- y1
##D phi <- fun1
##D 
##D ## Create an evaluation dataset sorting on z (for plotting)
##D 
##D evaldata <- data.frame(y,z,w)
##D evaldata <- evaldata[order(evaldata$z),]
##D 
##D ## Compute the non-IV regression spline estimator of E(y|z)
##D 
##D model.noniv <- crs(y~z,opts=opts)
##D mean.noniv <- predict(model.noniv,newdata=evaldata)
##D 
##D ## Compute the IV-regression spline estimator of phi(z)
##D 
##D model.iv <- crsiv(y=y,z=z,w=w)
##D phi.iv <- predict(model.iv,newdata=evaldata)
##D 
##D ## For the plots, restrict focal attention to the bulk of the data
##D ## (i.e. for the plotting area trim out 1/4 of one percent from each
##D ## tail of y and z)
##D 
##D trim <- 0.0025
##D 
##D curve(phi,min(z),max(z),
##D       xlim=quantile(z,c(trim,1-trim)),
##D       ylim=quantile(y,c(trim,1-trim)),
##D       ylab="Y",
##D       xlab="Z",
##D       main="Nonparametric Instrumental Spline Regression",
##D       sub=paste("Landweber-Fridman: iterations = ", model.iv$num.iterations,sep=""),
##D       lwd=1,lty=1)
##D 
##D points(z,y,type="p",cex=.25,col="grey")
##D 
##D lines(evaldata$z,evaldata$z^2 -0.325*evaldata$z,lwd=1,lty=1)
##D 
##D lines(evaldata$z,phi.iv,col="blue",lwd=2,lty=2)
##D 
##D lines(evaldata$z,mean.noniv,col="red",lwd=2,lty=4)
##D 
##D legend(quantile(z,trim),quantile(y,1-trim),
##D        c(expression(paste(varphi(z),", E(y|z)",sep="")),
##D          expression(paste("Nonparametric ",hat(varphi)(z))),
##D          "Nonparametric E(y|z)"),
##D        lty=c(1,2,4),
##D        col=c("black","blue","red"),
##D        lwd=c(1,2,2))
## End(Not run) 



