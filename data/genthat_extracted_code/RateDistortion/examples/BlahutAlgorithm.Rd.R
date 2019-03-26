library(RateDistortion)


### Name: BlahutAlgorithm
### Title: Implementation of the Blahut algorithm described in (Blahut,
###   1972).
### Aliases: BlahutAlgorithm

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

# A different cost function with additional named input arguments
cost.function.2 <- function(x, y, alpha = 1.0) {
    abs(y - x) ^ alpha
}

# Slope of the rate-distortion curve
s <- -1

# Compute the rate-distortion value at the given point s
channel <- BlahutAlgorithm(x, Px, y, cost.function, s)

# Not run:
# channel.2 <- BlahutAlgorithm(x, Px, y, cost.function.2, s, alpha = 1.5)

print(channel)




