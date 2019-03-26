library(gplm)


### Name: kde
### Title: Kernel density estimation
### Aliases: kde
### Keywords: smooth

### ** Examples

  n <- 1000
  x <- rnorm(n)
  plot(kde(x), type="l")

  ## mixed normal data
  n <- 1000
  u <- runif(n)
  thresh <- 0.4
  x <- rnorm(n)*(u<thresh) +rnorm(n,mean=3)*(u>=thresh)
  h <- 1
  fh <- kde(x,bandwidth=h)
  plot(kde(x,bandwidth=h),type="l",lwd=2); rug(x)
  lines(kde(x,bandwidth=h*1.2),col="red")
  lines(kde(x,bandwidth=h*1.4),col="orange")
  lines(kde(x,bandwidth=h/1.2),col="blue")
  lines(kde(x,bandwidth=h/1.4),col="cyan")

  ## two-dimensional data
  n <- 1000
  u <- runif(n)
  thresh <- 0.4
  x1 <- rnorm(n)*(u<thresh) +rnorm(n,mean=3)*(u>=thresh)
  x2 <- rnorm(n)*(u<thresh) +rnorm(n,mean=9)*(u>=thresh)

  grid1 <- seq(min(x1),max(x1),length=20)  ## grid for x1
  grid2 <- seq(min(x2),max(x2),length=25)  ## grid for x2

  fh <- kde( cbind(x1,x2), grid=create.grid(list(grid1,grid2)) )
  o <- order(fh$x[,2],fh$x[,1])
  density <- (matrix(fh$y[o],length(grid1),length(grid2)))
  
  par(mfrow=c(2,2))
  plot(kde(x1),type="l",main="x1"); rug(x1)
  plot(kde(x2),type="l",main="x2"); rug(x2)
  persp(grid1,grid2,density,main="KDE",
        theta=30,phi=30,expand=0.5,col="lightblue",shade=0.5)
  contour(grid1,grid2,density, main="KDE Contours")
  points(x1,x2,col="red",pch=18,cex=0.5)
  par(mfrow=c(1,1))



