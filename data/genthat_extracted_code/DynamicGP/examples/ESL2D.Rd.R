library(DynamicGP)


### Name: ESL2D
### Title: Expected Squared L_2 Discrepancy Approach for Estimating the
###   Solution to the Inverse Problem
### Aliases: ESL2D
### Keywords: GP model Inverse problem SVD

### ** Examples

  library("lhs")
  forretal <- function(x,t,shift=1)
  {
    par1 <- x[1]*6+4
    par2 <- x[2]*16+4
    par3 <- x[3]*6+1
    t <- t+shift
    y <- (par1*t-2)^2*sin(par2*t-par3)
  }
  timepoints <- seq(0,1,len=200)
  design <- lhs::randomLHS(30,3)
  candidate <- lhs::randomLHS(500,3)
  candidate <- rbind(candidate,design)

  ## evaluate the response matrix on the design matrix
  resp <- apply(design,1,forretal,timepoints)
  x0 <- runif(3)
  y0 <- forretal(x0,timepoints)
  yobs <- y0+rnorm(200,0,sd(y0)/sqrt(50))
  xhat <- ESL2D(design,resp,yobs,candidate)
  yhat <- forretal(xhat,timepoints)

  ## draw a figure to illustrate
  plot(y0,ylim=c(min(y0,yhat),max(y0,yhat)))
  lines(yhat,col="red")



