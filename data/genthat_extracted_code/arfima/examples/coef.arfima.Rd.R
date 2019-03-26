library(arfima)


### Name: coef.arfima
### Title: Extract Model Coefficients
### Aliases: coef.arfima
### Keywords: ts

### ** Examples


## No test: 
set.seed(8564)
sim <- arfima.sim(1000, model = list(phi = c(0.2, 0.1), dfrac = 0.4, theta = 0.9))
fit <- arfima(sim, order = c(2, 0, 1), back=TRUE)

fit
coef(fit)
## End(No test)




