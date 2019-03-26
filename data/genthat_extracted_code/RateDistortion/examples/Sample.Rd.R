library(RateDistortion)


### Name: Sample
### Title: Generate random samples from a channel distribution.
### Aliases: Sample

### ** Examples

# Define a discretized Gaussian information source
x <- seq(from = -10, to = 10, length.out = 100)
Px <- dnorm(x, mean = 0, sd = 3)
Px <- Px / sum(Px) # Ensure that probability sums to 1
y <- x # The destination alphabet is the same as the source

# Define a quadratic cost function
cost.function <- function(x, y) {
    (y - x)^2
}

# Slope of the rate-distortion curve
s <- -1

# Compute the rate-distortion value at the given point s
channel <- BlahutAlgorithm(x, Px, y, cost.function, s)

# Draw random samples from the output of this channel, for a given input
samples <- Sample(channel, 1000, 50, show.progress = TRUE)

# Plot a histogram of the output
hist(samples$y)




