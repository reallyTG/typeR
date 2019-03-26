library(ahnr)


### Name: fit
### Title: fit
### Aliases: fit

### ** Examples

# Create data
x <- 2 * runif(1000) - 1;
x <- sort(x)

y <- (x < 0.1) * (0.05 * runif(100) + atan(pi*x)) +
    (x >= 0.1 & x < 0.6) * (0.05 * runif(1000) + sin(pi*x)) +
    (x >= 0.6) * (0.05 * runif(1000) + cos(pi*x))

# Create Sigma list
Sigma <- list(X = data.frame(x = x), Y = data.frame(y = y))

# Train AHN
ahn <- fit(Sigma, 5, 0.01, 500)




