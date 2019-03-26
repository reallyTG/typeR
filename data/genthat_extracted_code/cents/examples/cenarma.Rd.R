library(cents)


### Name: cenarma
### Title: Censored arma estimation
### Aliases: cenarma
### Keywords: ts

### ** Examples

#Default example
#Example. Left-censoring, 10%
## Not run: 
##D set.seed(313177)
##D n <- 500
##D out <- rcarma(n, ar=0.8, ma=-0.6, mu=100, siga=15, rates=c(0.1, NA))
##D y <- out$y
##D iy <- out$iy
##D ans <- cenarma(y, iy, p=1, q=1)
##D ans[[1]]
##D #
##D #Example ARMA(1,1) with missing values.
##D #Fit using arima() and cenarma()
##D #compare final relative likelihood and difference log-likelihoods
##D set.seed(313177)
##D n <- 500
##D out <- rcarma(n, ar=0.8, ma=-0.6, mu=100, siga=15, rates=c(NA, NA), Mrate=0.25)
##D y <- out$y
##D iy <- out$iy
##D (ans0 <- arima(y, order=c(1,0,1)))
##D (ans1 <- cenarma(y, iy, p=1, q=1))[[1]]
##D logL0 <- ans0$loglik
##D betaHat <- coef(ans1[[1]])
##D arHat <- betaHat[1]
##D maHat <- betaHat[2]
##D muHat <- betaHat[3]
##D ans1B <- arima(y, order=c(1,0,1), fixed=c(arHat,maHat,muHat),transform.pars=FALSE)
##D logL1 <- ans1B$loglik
##D RL <- exp(logL1-logL0)
##D RL
##D logL1-logL0
## End(Not run)



