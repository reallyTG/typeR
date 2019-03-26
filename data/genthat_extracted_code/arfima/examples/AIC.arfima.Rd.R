library(arfima)


### Name: AIC.arfima
### Title: Information criteria for 'arfima' objects
### Aliases: AIC.arfima BIC BIC.arfima
### Keywords: ts

### ** Examples


## No test: 
set.seed(34577)
sim <- arfima.sim(500, model = list(theta = 0.9, phi = 0.5, dfrac = 0.4))
fit1 <- arfima(sim, order = c(1, 0, 1), cpus = 2, back=TRUE)
fit2 <- arfima(sim, order = c(1, 0, 1), cpus = 2, lmodel = "g", back=TRUE)
fit3 <- arfima(sim, order = c(1, 0, 1), cpus = 2, lmodel = "h", back=TRUE)

AIC(fit1)
AIC(fit2)
AIC(fit3)
## End(No test)




