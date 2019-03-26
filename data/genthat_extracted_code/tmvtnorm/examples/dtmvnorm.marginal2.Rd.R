library(tmvtnorm)


### Name: dtmvnorm.marginal2
### Title: Bivariate marginal density functions from a Truncated
###   Multivariate Normal distribution
### Aliases: dtmvnorm.marginal2
### Keywords: distribution multivariate

### ** Examples

  
  lower = c(-0.5, -1, -1)
  upper = c( 2.2,  2,  2)
  
  mean  = c(0,0,0)
  sigma = matrix(c(2.0, -0.6,  0.7, 
                  -0.6,  1.0, -0.2, 
                   0.7, -0.2,  1.0), 3, 3)
  
  # generate random samples from untruncated and truncated distribution
  Y = rmvnorm(10000, mean=mean, sigma=sigma)
  X = rtmvnorm(500,  mean=mean, sigma=sigma, lower=lower, upper=upper, 
      algorithm="gibbs")
    
  # compute bivariate marginal density of x1 and x2
  xq <- seq(lower[1], upper[1], by=0.1)
  xr <- seq(lower[2], upper[2], by=0.1)
  
  grid <- matrix(NA, length(xq), length(xr))
  for (i in 1:length(xq))
  {
    for (j in 1:length(xr))
    {
      grid[i,j] = dtmvnorm.marginal2(xq=xq[i], xr=xr[j], 
        q=1, r=2, sigma=sigma, lower=lower, upper=upper)
    }
  }
  
  plot(Y[,1], Y[,2], xlim=c(-4, 4), ylim=c(-4, 4), 
     main=expression("bivariate marginal density ("*x[1]*","*x[2]*")"), 
     xlab=expression(x[1]), ylab=expression(x[2]), col="gray80")
  points(X[,1], X[,2], col="black")
  
  lines(x=c(lower[1], upper[1], upper[1], lower[1], lower[1]), 
        y=c(lower[2],lower[2],upper[2],upper[2],lower[2]), 
        lty=2, col="red")
  contour(xq, xr, grid, add=TRUE, nlevels = 8, col="red", lwd=2)
  
  # scatterplot matrices for untruncated and truncated points
  require(lattice)
  splom(Y)
  splom(X)



