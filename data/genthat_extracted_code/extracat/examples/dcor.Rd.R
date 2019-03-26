library(extracat)


### Name: wdcor
### Title: Weighted Distance Correlation
### Aliases: wdcor wdcor.table wdcor.default wdcor.data.frame

### ** Examples


# repeat and change N for different results and computation times.
N <- 2000
x1 <- rnorm(N,mean=10,sd=3)
x2 <- runif(N,0,40)
x3 <- rnorm(N,mean=30,sd=4)
x <- sample(c(x1,x2,x3),N)		
			
y <- rnorm(1,sd=0.0001)*(x-mean(x))^4+ rnorm(1,sd=0.01)*(x-mean(x))^3
y <- y+ rnorm(1,sd=0.1)*(x-mean(x))^2 
y <- y+ rnorm(1)*(x-mean(x))+rnorm(N,sd=runif(N,3,10))
y <- y+ runif(N,0,20)*sin(abs(scale(x))*2*pi)

require(scales)
plot(x,y,pch=19,col=alpha("black",0.2))
system.time(dd<-wdcor(x,y))

y2 <- runif(2000)
system.time(dde<-wdcor(x,y2))
dd
dde

## Not run: 
##D y <- diamonds$price
##D x <- diamonds$carat
##D 
##D length(x) # 53940
##D 
##D # auto approximation via approx.dcor
##D wdcor(x,y) 
##D 
##D # the weighted distance correlation is also applicable to
##D # discrete data:
##D 
##D A <- arsim(2000,c(12,12),4,0.1)
##D wdcor(A)
##D wdcor(optile(A))
##D wdcor(optile(A, fun = "distcor"))
##D 
##D 
##D # kernel density weights:
##D kd <- kde2d(x,y,n=50)
##D 
##D xy <- expand.grid(kd$x,kd$y)
##D wdcor(xy[,1],xy[,2], w = kd$z)
##D # this is the approximate distance correlation for the 2D density estimate
## End(Not run)

# a pairwise matrix:
D <- wdcor(olives[,3:10])
fluctile(D^2, shape="c")




