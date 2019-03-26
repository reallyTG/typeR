library(Qtools)


### Name: plot.qlss
### Title: Quantile-based Summary Statistics for Location, Scale and Shape
### Aliases: plot.qlss
### Keywords: plot

### ** Examples


trees2 <- trees[order(trees$Height),]
fit <- qlss(Volume ~ Height, data = trees2, probs = c(.05, .1))
# Plot the results for probs = 0.1
plot(fit, z = trees2$Height, whichp = 0.1, xlab = "height")




