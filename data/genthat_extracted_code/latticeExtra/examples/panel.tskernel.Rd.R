library(latticeExtra)


### Name: panel.tskernel
### Title: Calculate and plot smoothed time series.
### Aliases: panel.tskernel simpleSmoothTs simpleSmoothTs.default
###   simpleSmoothTs.zoo
### Keywords: dplot

### ** Examples

## a Gaussian-like filter (contrast with c = 1 or c = 2)
xyplot(sunspot.year) +
layer(panel.tskernel(x, y, width = 20, c = 3, col = 1, lwd = 2))

## example from ?kernel:
## long and short moving averages, backwards in time
xyplot(EuStockMarkets[,1]) +
  layer(panel.tskernel(x, y, width = 100, col = 1, sides = 1)) +
  layer(panel.tskernel(x, y, width = 20, col = 2, sides = 1))

## per group, with a triangular filter
xyplot(EuStockMarkets, superpose = TRUE) +
  glayer(panel.tskernel(..., width = 100, c = 2),
         theme = simpleTheme(lwd = 2))

## plot the actual kernels used; note adjustment of width
width = 100
kdat <- lapply(1:4, function(c) {
    k <- kernel("daniell", rep(floor(0.5*width / sqrt(c)), c))
    ## demonstrate that the effective bandwidth stays the same:
    message("c = ", c, ": effective bandwidth = ", bandwidth.kernel(k))
    ## represent the kernel as a time series, for plotting
    ts(k[-k$m:k$m], start = -k$m)
})
names(kdat) <- paste("c =", 1:4)
xyplot(do.call(ts.union, kdat), type = "h",
    scales = list(y = list(relation = "same")))



