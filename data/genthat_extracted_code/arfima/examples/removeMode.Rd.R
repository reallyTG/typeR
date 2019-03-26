library(arfima)


### Name: removeMode
### Title: Removes a mode from an 'arfima' fit.
### Aliases: removeMode
### Keywords: ts

### ** Examples


## No test: 
set.seed(8765)
sim <- arfima.sim(1000, model = list(phi = 0.4, theta = 0.9, dfrac = 0.4))
fit <- arfima(sim, order = c(1, 0, 1), back=TRUE)
fit
fit <- removeMode(fit, 3)
fit
## End(No test)




