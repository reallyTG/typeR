library(RTransferEntropy)


### Name: coef.transfer_entropy
### Title: Extract the Coefficient Matrix from a transfer_entropy
### Aliases: coef.transfer_entropy

### ** Examples

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

te_result <- transfer_entropy(x, y, nboot = 100)
coef(te_result)



