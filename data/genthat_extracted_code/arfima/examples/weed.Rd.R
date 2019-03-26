library(arfima)


### Name: weed
### Title: Weeds out fits from a call to arfima that are too close to each
###   other.
### Aliases: weed
### Keywords: ts

### ** Examples


## No test: 
set.seed(1234)
sim <- arfima.sim(1000, model = list(theta = 0.9, dfrac = 0.4))
fit <- arfima(sim, order = c(0, 0, 1), autoweed = FALSE, back=TRUE)
fit
distance(fit)
fit1 <- weed(fit)
fit1
distance(fit1)
## End(No test)




