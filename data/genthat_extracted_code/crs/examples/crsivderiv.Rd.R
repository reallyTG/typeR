library(crs)


### Name: crsivderiv
### Title: Nonparametric Instrumental Derivatives
### Aliases: crsivderiv
### Keywords: instrument

### ** Examples

## Not run: 
##D ## This illustration was made possible by Samuele Centorrino
##D ## <samuele.centorrino@univ-tlse1.fr>
##D 
##D set.seed(42)
##D n <- 1000
##D 
##D ## For trimming the plot (trim .5% from each tail)
##D 
##D trim <- 0.005
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
##D ## Sort on z (for plotting)
##D 
##D ivdata <- data.frame(y,z,w,u,v)
##D ivdata <- ivdata[order(ivdata$z),]
##D rm(y,z,w,u,v)
##D attach(ivdata)
##D 
##D model.ivderiv <- crsivderiv(y=y,z=z,w=w)
##D 
##D ylim <-c(quantile(model.ivderiv$phi.prime,trim),
##D          quantile(model.ivderiv$phi.prime,1-trim))
##D 
##D plot(z,model.ivderiv$phi.prime,
##D      xlim=quantile(z,c(trim,1-trim)),
##D      main="",
##D      ylim=ylim,
##D      xlab="Z",
##D      ylab="Derivative",
##D      type="l",
##D      lwd=2)
##D rug(z)
## End(Not run) 



