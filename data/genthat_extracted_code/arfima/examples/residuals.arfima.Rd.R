library(arfima)


### Name: residuals.arfima
### Title: Extract the Residuals of a Fitted Object
### Aliases: residuals.arfima resid.arfima
### Keywords: ts

### ** Examples


## No test: 
set.seed(8564)
sim <- arfima.sim(1000, model = list(phi = c(0.2, 0.1), dfrac = 0.4, theta = 0.9))
fit <- arfima(sim, order = c(2, 0, 1), back=TRUE)

fit

resid <- resid(fit)
par(mfrow = c(1, 3))
plot(resid[[1]])
plot(resid[[2]])
plot(resid[[3]])
fitted <- fitted(fit)
plot(fitted[[1]], resid[[1]])
plot(fitted[[2]], resid[[2]])
plot(fitted[[3]], resid[[3]])
par(mfrow = c(1, 1))
## End(No test)




