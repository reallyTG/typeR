library(ROCit)


### Name: MLestimates
### Title: ML Estimate of Normal Parameters
### Aliases: MLestimates

### ** Examples

# Find the two parameters
set.seed(10)
points <- rnorm(200, 10, 5)
ML <- MLestimates(points)
message("The ML estimates are: mean = ", round(ML$mu, 3),
        " , SD = ", round(ML$sigma, 3))

#-----------------------------------------

# Superimpose smooth curve over hostogram
set.seed(100)
x <- rnorm(400)
hist(x, probability = TRUE, col = "gray90")
ML <- MLestimates(x)
x <- seq(-3, 3, 0.01)
density <- dnorm(x, mean = ML$mu, sd = ML$sigma)
lines(density~x, lwd = 2)




