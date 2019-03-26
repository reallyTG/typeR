library(features)


### Name: plot
### Title: Plotting the smoothed fucntion and its derivatives.
### Aliases: plot plot.features

### ** Examples

# Estimating the smooth and the derivatives of a noisy and discretely sampled function. 
n <- 200
x <- sort(runif(n))
y <- exp(-0.2 * sin(2*pi*x)) + rnorm(n, sd=0.05)

ans <- features(x, y)
plot(ans)

ans.sm <- features(x, y, smoother="smooth.spline")
plot(ans.sm)




