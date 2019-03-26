library(gplm)


### Name: kreg
### Title: Kernel regression
### Aliases: kreg
### Keywords: smooth

### ** Examples

  n <- 1000
  x <- rnorm(n)
  m <- sin(x)
  y <- m + rnorm(n)
  plot(x,y,col="gray")
  o <- order(x); lines(x[o],m[o],col="green")
  lines(kreg(x,y),lwd=2)

  ## two-dimensional
  n <- 100
  x <- 6*cbind(runif(n), runif(n))-3
  m <- function(x1,x2){ 4*sin(x1) + x2 }
  y <- m(x[,1],x[,2]) + rnorm(n)
  mh <- kreg(x,y)##,bandwidth=1)

  grid1 <- unique(mh$x[,1])
  grid2 <- unique(mh$x[,2])
  est.m  <- t(matrix(mh$y,length(grid1),length(grid2)))
  orig.m <- outer(grid1,grid2,m)
  par(mfrow=c(1,2))
  persp(grid1,grid2,orig.m,main="Original Function",
        theta=30,phi=30,expand=0.5,col="lightblue",shade=0.5)
  persp(grid1,grid2,est.m,main="Estimated Function",
	theta=30,phi=30,expand=0.5,col="lightblue",shade=0.5)
  par(mfrow=c(1,1))
  
  ## now with normal x, note the boundary problem,
  ## which can be somewhat reduced by a gaussian kernel
  n <- 1000
  x <- cbind(rnorm(n), rnorm(n))
  m <- function(x1,x2){ 4*sin(x1) + x2 }
  y <- m(x[,1],x[,2]) + rnorm(n)
  mh <- kreg(x,y)##,p="gaussian")

  grid1 <- unique(mh$x[,1])
  grid2 <- unique(mh$x[,2])
  est.m  <- t(matrix(mh$y,length(grid1),length(grid2)))
  orig.m <- outer(grid1,grid2,m)
  par(mfrow=c(1,2))
  persp(grid1,grid2,orig.m,main="Original Function",
        theta=30,phi=30,expand=0.5,col="lightblue",shade=0.5)
  persp(grid1,grid2,est.m,main="Estimated Function",
	theta=30,phi=30,expand=0.5,col="lightblue",shade=0.5)
  par(mfrow=c(1,1))



