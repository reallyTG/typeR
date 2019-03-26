library(RateDistortion)


### Name: ConditionalDistribution
### Title: Return the conditional output distribution for a given channel
###   and a given input.
### Aliases: ConditionalDistribution

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

# Compute & plot the conditional probability distribution for a particular channel input.
cpd <- ConditionalDistribution(channel, index = 50)
plot(cpd$y, cpd$p)




