library(DTWBI)


### Name: minCost
### Title: DTW-based methods for univariate signals
### Aliases: minCost

### ** Examples

data(dataDTWBI)
X <- dataDTWBI[, 1] ; Y <- dataDTWBI[, 2]

# Plot query and reference
plot(X, type = "l", ylim = c(-5,3))
lines(1:length(X), Y, col = "red")

#= Align signals using DTW
align_dtw <- minCost(X, Y, method = "DTW")
#= Align signals using DDTW
align_ddtw <- minCost(X, Y, method = "DDTW")
#= Align signals using AFBDTW
align_afbdtw <- minCost(X, Y, method = "AFBDTW")
#= Align signals using DTW-D
align_dtwd <- minCost(X, Y, method = "DTW-D")

#= Plots
library(dtw)
dtwPlotTwoWay(d = align_dtw, xts <- X, yts = Y, main = "DTW")
dtwPlotTwoWay(d = align_ddtw, xts <- X, yts = Y, main = "DDTW")
dtwPlotTwoWay(d = align_afbdtw, xts <- X, yts = Y, main = "AFBDTW")
dtwPlotTwoWay(d = align_dtwd, xts <- X, yts = Y, main = "DTW-D")

#= Compare cost of each method
comparative_cost <- matrix(c(align_dtw$normalizedDistance,
align_ddtw$normalizedDistance,
align_afbdtw$normalizedDistance,
align_dtwd$normalizedDistance), ncol = 4)
colnames(comparative_cost) <- c("DTW", "DDTW", "AFBDTW", "DTW-D")
comparative_cost



