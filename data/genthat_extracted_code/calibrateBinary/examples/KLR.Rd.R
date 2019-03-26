library(calibrateBinary)


### Name: KLR
### Title: Kernel Logistic Regression
### Aliases: KLR

### ** Examples

library(calibrateBinary)

set.seed(1)
np <- 10
xp <- seq(0,1,length.out = np)
eta_fun <- function(x) exp(exp(-0.5*x)*cos(3.5*pi*x)-1) # true probability function
eta_x <- eta_fun(xp)
yp <- rep(0,np)
for(i in 1:np) yp[i] <- rbinom(1,1, eta_x[i])

x.test <- seq(0,1,0.001)
etahat <- KLR(xp,yp,x.test)

plot(xp,yp)
curve(eta_fun, col = "blue", lty = 2, add = TRUE)
lines(x.test, etahat, col = 2)

#####   cross-validation with K=5    #####
##### to determine the parameter rho #####

cv.out <- cv.KLR(xp,yp,K=5)
print(cv.out)

etahat.cv <- KLR(xp,yp,x.test,lambda=cv.out$lambda,rho=cv.out$rho)

plot(xp,yp)
curve(eta_fun, col = "blue", lty = 2, add = TRUE)
lines(x.test, etahat, col = 2)
lines(x.test, etahat.cv, col = 3)




