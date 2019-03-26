library(AdaptFitOS)


### Name: scbM
### Title: Calculate simultaneous confidence bands for penalized splines
### Aliases: scbM
### Keywords: smooth dplot

### ** Examples

## Not run: 
##D beta=function(l,m,x) 
##D 		return(gamma(l+m)*(gamma(l)*gamma(m))^(-1)*x^(l-1)*(1-x)^(m-1))
##D f1 = function(x) return((0.6*beta(30,17,x)+0.4*beta(3,11,x))*1/0.958)
##D f2 = function(z) return((sin(2*pi*(z-0.5))^2)*1/.3535)
##D f3 = function(z) 
##D 		return((exp(-400*(z-0.6)^2)+
##D 				5/3*exp(-500*(z-0.75)^2)+2*exp(-500*(z-0.9)^2))*1/0.549)
##D center=function(x) return(x-mean(x))
##D 
##D set.seed(1)
##D N <- 500
##D x1 = runif(N,0,1)
##D x2 = runif(N,0,1)
##D x3 = runif(N,0,1)
##D 
##D 
##D kn1 <- default.knots(x1,40)
##D kn2 <- default.knots(x2,40)
##D kn3 <- default.knots(x3,40)
##D kn.var3 <- default.knots(kn3,5)
##D 
##D y <- f1(x1)+f2(x2)+f3(x3)+0.3*rnorm(N)
##D 
##D # fit model with last smoothing parameter adaptive
##D   fit2b=  asp2(y~f(x1, basis="os", degree=3, knots=kn1, adap=FALSE)
##D                 +f(x2, basis="os", degree=3, knots=kn2, adap=FALSE)
##D                 +f(x3, basis="os", degree=3, knots=kn3, adap=TRUE,
##D                        var.knots=kn.var3, var.basis="os", var.degree=3),
##D                 niter = 20, niter.var = 200)
##D 
##D   # compute 95##D 
##D   # You could skip this and use "fit2b" indstead of "scb2b" later on, 
##D   # however, if N is large, computing the SCBs various times can take 
##D   # some time if you don't need fitted values and bounds for all covariate points
##D   # (can be computationally intensive due to large matrix dimensions),
##D   # set calc.stdev=F such that these are not computed.
##D     scb2b<- scbM(fit2b,calc.stdev=FALSE)
##D     plot(scb2b,pages=1)
##D 
##D   # plot first derivative of f(x1)
##D     scb2bdrv<- scbM(fit2b,drv=1,calc.stdev=FALSE)
##D     plot(scb2bdrv,select=1)
##D     #the following would give the same result
##D     #plot(fit2b,select=1,drv=1)
##D     #different style
##D     plot(scb2bdrv,select=1,scb.lty="blank", shade=TRUE,
##D     									shade.col="steelblue")
## End(Not run)



