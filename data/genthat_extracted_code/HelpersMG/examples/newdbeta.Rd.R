library(HelpersMG)


### Name: newdbeta
### Title: Density for the Beta distributions.
### Aliases: newdbeta

### ** Examples

pi <- rbeta(100, shape1=0.48, shape2=0.12)
hist(pi, freq=FALSE, breaks=seq(from=0, to=1, by=0.1), ylim=c(0, 8), las=1)
library("HelpersMG")
mx <- ScalePreviousPlot()$ylim["end"]/
      max(newdbeta(seq(from=0.01, to=0.99, by=0.01), mu = 0.8, v=0.1))
curve(newdbeta(x, mu = 0.8, v=0.1)*mx, add=TRUE, col="red")



