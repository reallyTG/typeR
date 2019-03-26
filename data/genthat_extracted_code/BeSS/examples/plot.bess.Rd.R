library(BeSS)


### Name: plot.bess
### Title: Produces a coefficient profile plot of the coefficient or loss
###   function paths
### Aliases: plot.bess

### ** Examples

#--------------linear model--------------#

data <- gen.data(500, 20, family = "gaussian", 10, 0.2, 1)
fit <- bess(data$x, data$y, family = "gaussian")
plot(fit, type = "both")




