library(np)


### Name: npcopula
### Title: Kernel Copula Estimation with Mixed Data Types
### Aliases: npcopula
### Keywords: nonparametric

### ** Examples

## Not run: 
##D ## Example 1: Bivariate Mixed Data
##D 
##D require(MASS)
##D 
##D set.seed(42)
##D 
##D ## Simulate correlated Gaussian data (rho(x,y)=0.99)
##D 
##D n <- 1000
##D n.eval <- 100
##D rho <- 0.99
##D mu <- c(0,0)
##D Sigma <- matrix(c(1,rho,rho,1),2,2)
##D mydat <- mvrnorm(n=n, mu, Sigma)
##D mydat <- data.frame(x=mydat[,1],
##D                     y=ordered(as.integer(cut(mydat[,2],
##D                       quantile(mydat[,2],seq(0,1,by=.1)),
##D                       include.lowest=TRUE))-1))
##D q.min <- 0.0
##D q.max <- 1.0
##D grid.seq <- seq(q.min,q.max,length=n.eval)
##D grid.dat <- cbind(grid.seq,grid.seq)
##D 
##D ## Estimate the copula (bw object obtained from npudistbw())
##D 
##D bw.cdf <- npudistbw(~x+y,data=mydat)
##D copula <- npcopula(bws=bw.cdf,data=mydat,u=grid.dat)
##D 
##D ## Plot the copula
##D 
##D 
##D contour(grid.seq,grid.seq,matrix(copula$copula,n.eval,n.eval),
##D         xlab="u1",
##D         ylab="u2",
##D         main="Copula Contour")
##D 
##D persp(grid.seq,grid.seq,matrix(copula$copula,n.eval,n.eval),
##D       ticktype="detailed",
##D       xlab="u1",
##D       ylab="u2",
##D       zlab="Copula",zlim=c(0,1))
##D 
##D ## Plot the empirical copula
##D 
##D copula.emp <- npcopula(bws=bw.cdf,data=mydat)
##D 
##D plot(copula.emp$u1,copula.emp$u2,
##D      xlab="u1",
##D      ylab="u2",
##D      cex=.25,
##D      main="Empirical Copula")
##D 
##D ## Estimate the copula density (bw object obtained from npudensbw())
##D 
##D bw.pdf <- npudensbw(~x+y,data=mydat)
##D copula <- npcopula(bws=bw.pdf,data=mydat,u=grid.dat)
##D 
##D ## Plot the copula density
##D 
##D persp(grid.seq,grid.seq,matrix(copula$copula,n.eval,n.eval),
##D       ticktype="detailed",
##D       xlab="u1",
##D       ylab="u2",
##D       zlab="Copula Density")
##D 
##D ## Example 2: Bivariate Continuous Data
##D 
##D require(MASS)
##D 
##D set.seed(42)
##D 
##D ## Simulate correlated Gaussian data (rho(x,y)=0.99)
##D 
##D n <- 1000
##D n.eval <- 100
##D rho <- 0.99
##D mu <- c(0,0)
##D Sigma <- matrix(c(1,rho,rho,1),2,2)
##D mydat <- mvrnorm(n=n, mu, Sigma)
##D mydat <- data.frame(x=mydat[,1],y=mydat[,2])
##D 
##D q.min <- 0.0
##D q.max <- 1.0
##D grid.seq <- seq(q.min,q.max,length=n.eval)
##D grid.dat <- cbind(grid.seq,grid.seq)
##D 
##D ## Estimate the copula (bw object obtained from npudistbw())
##D 
##D bw.cdf <- npudistbw(~x+y,data=mydat)
##D copula <- npcopula(bws=bw.cdf,data=mydat,u=grid.dat)
##D 
##D ## Plot the copula
##D 
##D contour(grid.seq,grid.seq,matrix(copula$copula,n.eval,n.eval),
##D         xlab="u1",
##D         ylab="u2",
##D         main="Copula Contour")
##D 
##D persp(grid.seq,grid.seq,matrix(copula$copula,n.eval,n.eval),
##D       ticktype="detailed",
##D       xlab="u1",
##D       ylab="u2",
##D       zlab="Copula",
##D       zlim=c(0,1))
##D 
##D ## Plot the empirical copula
##D 
##D copula.emp <- npcopula(bws=bw.cdf,data=mydat)
##D 
##D plot(copula.emp$u1,copula.emp$u2,
##D      xlab="u1",
##D      ylab="u2",
##D      cex=.25,
##D      main="Empirical Copula")
##D 
##D ## Estimate the copula density (bw object obtained from npudensbw())
##D 
##D bw.pdf <- npudensbw(~x+y,data=mydat)
##D copula <- npcopula(bws=bw.pdf,data=mydat,u=grid.dat)
##D 
##D ## Plot the copula density
##D 
##D persp(grid.seq,grid.seq,matrix(copula$copula,n.eval,n.eval),
##D       ticktype="detailed",
##D       xlab="u1",
##D       ylab="u2",
##D       zlab="Copula Density")
## End(Not run) 



