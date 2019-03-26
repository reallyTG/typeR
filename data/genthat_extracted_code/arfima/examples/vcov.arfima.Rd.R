library(arfima)


### Name: vcov.arfima
### Title: Extracts the Variance-Covariance Matrix
### Aliases: vcov.arfima
### Keywords: ts

### ** Examples


## No test: 
set.seed(1234)
sim <- arfima.sim(1000, model = list(dfrac = 0.4, phi = .8, theta = -0.5))
fit1 <- arfima(sim, order = c(1, 0, 1), back=TRUE)
fit2 <- arfima(sim, order = c(1, 0, 1), lmodel = "g", back=TRUE)
fit3 <- arfima(sim, order = c(1, 0, 1), lmodel = "h", back=TRUE)
fit1
fit2
fit3
vcov(fit1)
vcov(fit2)
vcov(fit2)
## End(No test)




