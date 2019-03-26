library(ape)


### Name: rlineage
### Title: Tree Simulation Under the Time-Dependent Birth-Death Models
### Aliases: rlineage rbdtree rphylo drop.fossil
### Keywords: datagen

### ** Examples

set.seed(10)
plot(rlineage(0.1, 0)) # Yule process with lambda = 0.1
plot(rlineage(0.1, 0.05)) # simple birth-death process
b <- function(t) 1/(1 + exp(0.2*t - 1)) # logistic
layout(matrix(0:3, 2, byrow = TRUE))
curve(b, 0, 50, xlab = "Time", ylab = "")
mu <- 0.07
segments(0, mu, 50, mu, lty = 2)
legend("topright", c(expression(lambda), expression(mu)),
       lty = 1:2, bty = "n")
plot(rlineage(b, mu), show.tip.label = FALSE)
title("Simulated with 'rlineage'")
plot(rbdtree(b, mu), show.tip.label = FALSE)
title("Simulated with 'rbdtree'")



