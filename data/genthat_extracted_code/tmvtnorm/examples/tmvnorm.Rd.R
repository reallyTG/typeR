library(tmvtnorm)


### Name: tmvnorm
### Title: Truncated Multivariate Normal Density
### Aliases: dtmvnorm
### Keywords: distribution multivariate

### ** Examples

dtmvnorm(x=c(0,0), mean=c(1,1), upper=c(0,0))

###########################################
#
# Example 1: 
# truncated multivariate normal density        
#
############################################

x1<-seq(-2, 3, by=0.1)
x2<-seq(-2, 3, by=0.1)

density<-function(x)
{
  sigma=matrix(c(1, -0.5, -0.5, 1), 2, 2)
  z=dtmvnorm(x, mean=c(0,0), sigma=sigma, lower=c(-1,-1))
  z
}

fgrid <- function(x, y, f)
{
    z <- matrix(nrow=length(x), ncol=length(y))
    for(m in 1:length(x)){
        for(n in 1:length(y)){
            z[m,n] <- f(c(x[m], y[n]))
        }
    }
    z
}

# compute density d for grid
d=fgrid(x1, x2, density)

# plot density as contourplot
contour(x1, x2, d, nlevels=5, main="Truncated Multivariate Normal Density", 
  xlab=expression(x[1]), ylab=expression(x[2]))
abline(v=-1, lty=3, lwd=2)
abline(h=-1, lty=3, lwd=2)

###########################################
#
# Example 2: 
# generation of random numbers
# from a truncated multivariate normal distribution        
#
############################################

sigma <- matrix(c(4,2,2,3), ncol=2)
x <- rtmvnorm(n=500, mean=c(1,2), sigma=sigma, upper=c(1,0))
plot(x, main="samples from truncated bivariate normal distribution",
  xlim=c(-6,6), ylim=c(-6,6), 
  xlab=expression(x[1]), ylab=expression(x[2]))
abline(v=1, lty=3, lwd=2, col="gray")
abline(h=0, lty=3, lwd=2, col="gray")



