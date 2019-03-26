library(RTransferEntropy)


### Name: calc_te
### Title: Calculates the Transfer Entropy for two time series
### Aliases: calc_te

### ** Examples

# construct two time-series
set.seed(1234567890)
n <- 1000
x <- rep(0, n + 1)
y <- rep(0, n + 1)

for (i in seq(n)) {
  x[i + 1] <- 0.2 * x[i] + rnorm(1, 0, 2)
  y[i + 1] <- x[i] + rnorm(1, 0, 2)
}

x <- x[-1]
y <- y[-1]

# calculate the X->Y transfer entropy value
calc_te(x, y)

# calculate the Y->X transfer entropy value
calc_te(y, x)

## No test: 
  # Compare the results
  calc_te(x, y, seed = 123)
  calc_te(y, x, seed = 123)
  transfer_entropy(x, y, nboot = 0, seed = 123)
## End(No test)



