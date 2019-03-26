library(RTransferEntropy)


### Name: print.transfer_entropy
### Title: Prints a transfer-entropy result
### Aliases: print.transfer_entropy

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

print(te_result)

# change the number of digits
print(te_result, digits = 10)

# disable boot-print
print(te_result, boot = FALSE)

# specify the quantiles of the bootstraps
print(te_result, probs = c(0, 0.1, 0.4, 0.5, 0.6, 0.9, 1))



