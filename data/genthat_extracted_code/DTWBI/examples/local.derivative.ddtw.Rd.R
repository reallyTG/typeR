library(DTWBI)


### Name: local.derivative.ddtw
### Title: Local derivative estimate to compute DDTW
### Aliases: local.derivative.ddtw

### ** Examples

data(dataDTWBI)
X <- dataDTWBI[, 1]
local.derivative.ddtw(X)

# Plot
plot(X, type = "b", ylim = c(-1, 1))
lines(local.derivative.ddtw(X), col = "red")



