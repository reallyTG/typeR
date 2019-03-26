library(RateDistortion)


### Name: MaximumCost
### Title: Compute the maximum cost for an information source and cost
###   function.
### Aliases: MaximumCost

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

MaximumCost(x, y, cost.function)



