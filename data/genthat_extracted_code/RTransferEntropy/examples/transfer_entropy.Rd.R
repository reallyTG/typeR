library(RTransferEntropy)


### Name: transfer_entropy
### Title: Function to estimate Shannon and Renyi transfer entropy between
###   two time series x and y.
### Aliases: transfer_entropy

### ** Examples

# construct two time-series
set.seed(1234567890)
n <- 500
x <- rep(0, n + 1)
y <- rep(0, n + 1)

for (i in seq(n)) {
  x[i + 1] <- 0.2 * x[i] + rnorm(1, 0, 2)
  y[i + 1] <- x[i] + rnorm(1, 0, 2)
}

x <- x[-1]
y <- y[-1]

# Calculate Shannon's Transfer Entropy
te_result <- transfer_entropy(x, y, nboot = 100)
te_result

summary(te_result)

## No test: 
  # Parallel Processing using the future-package
  library(future)
  plan(multiprocess)

  te_result2 <- transfer_entropy(x, y, nboot = 100)
  te_result2

  # revert back to sequential execution
  plan(sequential)

  te_result2 <- transfer_entropy(x, y, nboot = 100)
  te_result2

  # General set of quiet
  set_quiet(TRUE)
  a <- transfer_entropy(x, y, nboot = 0)

  set_quiet(FALSE)
  a <- transfer_entropy(x, y, nboot = 0)
## End(No test)



