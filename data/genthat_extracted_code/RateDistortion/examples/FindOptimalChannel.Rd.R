library(RateDistortion)


### Name: FindOptimalChannel
### Title: Find an optimal information channel for a given source, cost
###   function, and limit on information rate.
### Aliases: FindOptimalChannel

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

R <- 1.5
Q <- FindOptimalChannel(x, Px, y, cost.function, R, verbose = TRUE)
print(Q)




