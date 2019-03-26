library(rddensity)


### Name: rdplotdensity
### Title: Density Plot
### Aliases: rdplotdensity

### ** Examples

# density being discontinuous
set.seed(42)
x <- rnorm(2000, mean = -0.5); x[x>0] <- x[x>0] * 2
rdd <- rddensity(X = x)
plot <- rdplotdensity(rdd, x, plotRange = c(-2, 2), plotN = 25)



