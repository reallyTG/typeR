library(arfima)


### Name: bestModes
### Title: Finds the best modes of an 'arfima' fit.
### Aliases: bestModes
### Keywords: ts

### ** Examples


## No test: 
set.seed(8765)
sim <- arfima.sim(1000, model = list(phi = 0.4, theta = 0.9, dfrac = 0.4))
fit <- arfima(sim, order = c(1, 0, 1), back=TRUE)
fit
fit <- bestModes(fit, 2)
fit
## End(No test)




