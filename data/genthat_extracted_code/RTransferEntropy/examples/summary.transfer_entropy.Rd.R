library(RTransferEntropy)


### Name: summary.transfer_entropy
### Title: Prints a summary of a transfer-entropy result
### Aliases: summary.transfer_entropy

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

summary(te_result)



