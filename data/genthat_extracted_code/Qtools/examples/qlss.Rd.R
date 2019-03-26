library(Qtools)


### Name: qlss
### Title: Quantile-based Summary Statistics for Location, Scale and Shape
### Aliases: qlss.default qlss.formula qlss.numeric qlss
### Keywords: conditional quantiles unconditional quantiles
###   location-scale-shape

### ** Examples


# Compute summary statistics of a normal distribution
qlss()

# Compute summary statistics of a t distribution with 3 df
qlss(fun = "qt", df = 3, probs = 0.05)

# Compute summary statistics for a sample using a sequence of probabilities
x <- rnorm(1000)
qlss(x, probs = c(0.1, 0.2, 0.3, 0.4))

# Compute summary statistics for Volume conditional on Height
trees2 <- trees[order(trees$Height),]
fit <- qlss(Volume ~ Height, data = trees2)
plot(fit, z = trees2$Height, xlab = "height")

# Use a quadratic model for Height
fit <- qlss(Volume ~ poly(Height,2), data = trees2)
plot(fit, z = trees2$Height, xlab = "height")





