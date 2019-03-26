library(QuantifQuantile)


### Name: plot.QuantifQuantile
### Title: Plot of estimated conditional quantiles using optimal
###   quantization.
### Aliases: plot.QuantifQuantile

### ** Examples

#for a univariate X
set.seed(644972)
n <- 300
X <- runif(300,-2,2)
Y <- X^2+rnorm(n)
res <- QuantifQuantile(X,Y,testN=seq(10,25,by=5))
plot(res,ise=TRUE)

## Not run: 
##D set.seed(92536)
##D n <- 300
##D X <- runif(300,-2,2)
##D Y <- X^2+rnorm(n)
##D res <- QuantifQuantile(X,Y,testN=seq(10,25,by=5),x=1)
##D plot(res,ise=TRUE)
##D 
##D 
##D #for a bivariate X
##D #(a few seconds to execute)
##D set.seed(253664)
##D d <- 2
##D n <- 1000
##D X<-matrix(runif(d*n,-2,2),nr=d)
##D Y<-apply(X^2,2,sum)+rnorm(n)
##D res <- QuantifQuantile.d2(X,Y,testN=seq(80,130,by=10),B=20,tildeB=15)
##D plot(res,ise=TRUE)
##D 
##D set.seed(193854)
##D d <- 2
##D n <- 1000
##D X<-matrix(runif(d*n,-2,2),nr=d)
##D Y<-apply(X^2,2,sum)+rnorm(n)
##D res <- QuantifQuantile.d2(X,Y,testN=seq(110,140,by=10),x=as.matrix(c(1,0)),
##D B=30,tildeB=20)
##D plot(res,ise=TRUE)
## End(Not run)



