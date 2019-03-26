library(arfima)


### Name: tacfplot
### Title: Plots the theoretical autocorralation functions (tacfs) of one
###   or more fits.
### Aliases: tacfplot
### Keywords: ts

### ** Examples


## No test: 
set.seed(34577)
sim <- arfima.sim(500, model = list(theta = 0.9, phi = 0.5, dfrac = 0.4))
fit1 <- arfima(sim, order = c(1, 0, 1), cpus = 2, back=TRUE)
fit2 <- arfima(sim, order = c(1, 0, 1), cpus = 2, lmodel = "g", back=TRUE)
fit3 <- arfima(sim, order = c(1, 0, 1), cpus = 2, lmodel = "h", back=TRUE)
fit1
fit2
fit3
tacfplot(fits = list(fit1, fit2, fit3), maxlag = 30)
## End(No test)




