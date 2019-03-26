library(dlm)


### Name: arms
### Title: Function to perform Adaptive Rejection Metropolis Sampling
### Aliases: arms
### Keywords: distribution multivariate misc

### ** Examples

#### ==> Warning: running the examples may take a few minutes! <== ####    
## Not run: 
##D set.seed(4521222)
##D ### Univariate densities
##D ## Unif(-r,r) 
##D y <- arms(runif(1,-1,1), function(x,r) 1, function(x,r) (x>-r)*(x<r), 5000, r=2)
##D summary(y); hist(y,prob=TRUE,main="Unif(-r,r); r=2")
##D ## Normal(mean,1)
##D norldens <- function(x,mean) -(x-mean)^2/2 
##D y <- arms(runif(1,3,17), norldens, function(x,mean) ((x-mean)>-7)*((x-mean)<7),
##D           5000, mean=10)
##D summary(y); hist(y,prob=TRUE,main="Gaussian(m,1); m=10")
##D curve(dnorm(x,mean=10),3,17,add=TRUE)
##D ## Exponential(1)
##D y <- arms(5, function(x) -x, function(x) (x>0)*(x<70), 5000)
##D summary(y); hist(y,prob=TRUE,main="Exponential(1)")
##D curve(exp(-x),0,8,add=TRUE)
##D ## Gamma(4.5,1) 
##D y <- arms(runif(1,1e-4,20), function(x) 3.5*log(x)-x,
##D           function(x) (x>1e-4)*(x<20), 5000)
##D summary(y); hist(y,prob=TRUE,main="Gamma(4.5,1)")
##D curve(dgamma(x,shape=4.5,scale=1),1e-4,20,add=TRUE)
##D ## Gamma(0.5,1) (this one is not log-concave)
##D y <- arms(runif(1,1e-8,10), function(x) -0.5*log(x)-x,
##D           function(x) (x>1e-8)*(x<10), 5000)
##D summary(y); hist(y,prob=TRUE,main="Gamma(0.5,1)")
##D curve(dgamma(x,shape=0.5,scale=1),1e-8,10,add=TRUE)
##D ## Beta(.2,.2) (this one neither)
##D y <- arms(runif(1), function(x) (0.2-1)*log(x)+(0.2-1)*log(1-x),
##D           function(x) (x>1e-5)*(x<1-1e-5), 5000)
##D summary(y); hist(y,prob=TRUE,main="Beta(0.2,0.2)")
##D curve(dbeta(x,0.2,0.2),1e-5,1-1e-5,add=TRUE)
##D ## Triangular
##D y <- arms(runif(1,-1,1), function(x) log(1-abs(x)), function(x) abs(x)<1, 5000)     
##D summary(y); hist(y,prob=TRUE,ylim=c(0,1),main="Triangular")
##D curve(1-abs(x),-1,1,add=TRUE)
##D ## Multimodal examples (Mixture of normals)
##D lmixnorm <- function(x,weights,means,sds) {
##D     log(crossprod(weights, exp(-0.5*((x-means)/sds)^2 - log(sds))))
##D }
##D y <- arms(0, lmixnorm, function(x,...) (x>(-100))*(x<100), 5000, weights=c(1,3,2),
##D           means=c(-10,0,10), sds=c(1.5,3,1.5))
##D summary(y); hist(y,prob=TRUE,main="Mixture of Normals")
##D curve(colSums(c(1,3,2)/6*dnorm(matrix(x,3,length(x),byrow=TRUE),c(-10,0,10),c(1.5,3,1.5))),
##D       par("usr")[1], par("usr")[2], add=TRUE)
##D 
##D ### Bivariate densities 
##D ## Bivariate standard normal
##D y <- arms(c(0,2), function(x) -crossprod(x)/2,
##D           function(x) (min(x)>-5)*(max(x)<5), 500)
##D plot(y, main="Bivariate standard normal", asp=1)
##D ## Uniform in the unit square
##D y <- arms(c(0.2,.6), function(x) 1,
##D           function(x) (min(x)>0)*(max(x)<1), 500)
##D plot(y, main="Uniform in the unit square", asp=1)
##D polygon(c(0,1,1,0),c(0,0,1,1))
##D ## Uniform in the circle of radius r
##D y <- arms(c(0.2,0), function(x,...) 1,
##D           function(x,r2) sum(x^2)<r2, 500, r2=2^2)
##D plot(y, main="Uniform in the circle of radius r; r=2", asp=1)
##D curve(-sqrt(4-x^2), -2, 2, add=TRUE)
##D curve(sqrt(4-x^2), -2, 2, add=TRUE)
##D ## Uniform on the simplex
##D simp <- function(x) if ( any(x<0) || (sum(x)>1) ) 0 else 1
##D y <- arms(c(0.2,0.2), function(x) 1, simp, 500)
##D plot(y, xlim=c(0,1), ylim=c(0,1), main="Uniform in the simplex", asp=1)
##D polygon(c(0,1,0), c(0,0,1))
##D ## A bimodal distribution (mixture of normals)
##D bimodal <- function(x) { log(prod(dnorm(x,mean=3))+prod(dnorm(x,mean=-3))) }
##D y <- arms(c(-2,2), bimodal, function(x) all(x>(-10))*all(x<(10)), 500)
##D plot(y, main="Mixture of bivariate Normals", asp=1)
##D 
##D ## A bivariate distribution with non-convex support
##D support <- function(x) {
##D     return(as.numeric( -1 < x[2] && x[2] < 1 &&
##D                       -2 < x[1] &&
##D                       ( x[1] < 1 || crossprod(x-c(1,0)) < 1 ) ) )
##D }
##D Min.log <- log(.Machine$double.xmin) + 10
##D logf <- function(x) {
##D     if ( x[1] < 0 ) return(log(1/4))
##D     else
##D         if (crossprod(x-c(1,0)) < 1 ) return(log(1/pi))
##D     return(Min.log)
##D }
##D x <- as.matrix(expand.grid(seq(-2.2,2.2,length=40),seq(-1.1,1.1,length=40)))
##D y <- sapply(1:nrow(x), function(i) support(x[i,]))
##D plot(x,type='n',asp=1)
##D points(x[y==1,],pch=1,cex=1,col='green')
##D z <- arms(c(0,0), logf, support, 1000)
##D points(z,pch=20,cex=0.5,col='blue')
##D polygon(c(-2,0,0,-2),c(-1,-1,1,1))
##D curve(-sqrt(1-(x-1)^2),0,2,add=TRUE)
##D curve(sqrt(1-(x-1)^2),0,2,add=TRUE)
##D sum( z[,1] < 0 ) # sampled points in the square
##D sum( apply(t(z)-c(1,0),2,crossprod) < 1 ) # sampled points in the circle
## End(Not run)



