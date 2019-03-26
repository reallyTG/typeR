library(calibrateBinary)


### Name: calibrateBinary
### Title: Calibration for Binary Outputs
### Aliases: calibrateBinary

### ** Examples

library(calibrateBinary)

set.seed(1)
#####   data from physical experiment   #####
np <- 10
xp <- seq(0,1,length.out = np)
eta_fun <- function(x) exp(exp(-0.5*x)*cos(3.5*pi*x)-1) # true probability function
eta_x <- eta_fun(xp)
yp <- rep(0,np)
for(i in 1:np) yp[i] <- rbinom(1,1, eta_x[i])

#####   data from computer experiment   #####
ns <- 20
xs <- matrix(runif(ns*2), ncol=2)  # the first column corresponds to the column of xp
p_xtheta <- function(x,theta) {
     # true probability function
     exp(exp(-0.5*x)*cos(3.5*pi*x)-1) - abs(theta-0.3) *exp(-0.5*x)*cos(3.5*pi*x)
}
ys <- rep(0,ns)
for(i in 1:ns) ys[i] <- rbinom(1,1, p_xtheta(xs[i,1],xs[i,2]))

#####    check the true parameter    #####
curve(eta_fun, lwd=2, lty=2, from=0, to=1)
curve(p_xtheta(x,0.3), add=TRUE, col=4)   # true value = 0.3: L2 dist = 0
curve(p_xtheta(x,0.9), add=TRUE, col=3)   # other value

##### calibration: true parameter is 0.3 #####
## No test: 
calibrate.result <- calibrateBinary(xp, yp, xs[,1], xs[,2], ys)
print(calibrate.result)
## End(No test)



