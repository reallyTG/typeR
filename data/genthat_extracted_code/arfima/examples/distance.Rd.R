library(arfima)


### Name: distance
### Title: The distance between modes of an 'arfima' fit.
### Aliases: distance
### Keywords: ts

### ** Examples


## No test: 
set.seed(8564)
sim <- arfima.sim(1000, model = list(phi = c(0.2, 0.1), dfrac = 0.4, theta = 0.9))
fit <- arfima(sim, order = c(2, 0, 1), back=TRUE)

fit

distance(fit)
## End(No test)




