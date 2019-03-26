library(arfima)


### Name: plot.tacvf
### Title: Plots the output from a call to 'tacvf'
### Aliases: plot.tacvf
### Keywords: ts

### ** Examples


set.seed(1234)
sim <- arfima.sim(1000, model = list(theta = 0.99, dfrac = 0.49))
fit <- arfima(sim, order = c(0, 0, 1))
plot(tacvf(fit))
plot(tacvf(fit), tacf = TRUE)




