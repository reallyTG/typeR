library(Rssa)


### Name: plot.reconstruction
### Title: Plot the results of SSA reconstruction
### Aliases: plot.reconstruction plot.ssa.reconstruction
###   plot.1d.ssa.reconstruction plot.toeplitz.ssa.reconstruction
###   plot.mssa.reconstruction plot.2d.ssa.reconstruction
###   plot.nd.ssa.reconstruction

### ** Examples

## No test: 
# Decompose 'co2' series with default parameters
s <- ssa(co2)
r <- reconstruct(s, groups = list(c(1, 4), c(2, 3), c(5, 6)))
# Plot full 'co2' reconstruction into trend, periodic components and noise
plot(r)

# Artificial image for 2dSSA
mx <- outer(1:50, 1:50,
            function(i, j) sin(2*pi * i/17) * cos(2*pi * j/7) + exp(i/25 - j/20)) +
      rnorm(50^2, sd = 0.1)
# Decompose 'mx' with default parameters
s <- ssa(mx, kind = "2d-ssa")
# Reconstruct
r <- reconstruct(s, groups = list(1, 2:5))
# Plot components, original image and residuals
plot(r)
# Plot cumulative sum of components only
plot(r, type = "cumsum", add.residuals = FALSE, add.original = FALSE)

# Real example: Mars photo
data(Mars)
# Decompose only Mars image (without backgroud)
s <- ssa(Mars, mask = Mars != 0, wmask = circle(50), kind = "2d-ssa")
# Reconstruct and plot trend
plot(reconstruct(s, 1), fill.uncovered = "original")
# Reconstruct and plot texture pattern
plot(reconstruct(s, groups = list(c(13, 14, 17, 18))))

# Decompose 'EuStockMarkets' series with default parameters
s <- ssa(EuStockMarkets, kind = "mssa")
r <- reconstruct(s, groups = list(Trend = 1:2))
# Plot original series, trend and residuals superimposed
plot(r, plot.method = "xyplot", superpose = TRUE,
     auto.key = list(columns = 3),
     col = c("blue", "green", "red", "violet"),
     lty = c(rep(1, 4), rep(2, 4), rep(3, 4)))
# Plot the series separately
plot(r, plot.method = "xyplot", add.residuals = FALSE,
     screens = list(colnames(EuStockMarkets)),
     col = c("blue", "green", "red", "violet"),
     lty = c(rep(1, 4), rep(2, 4), rep(3, 4)))

# 3D-SSA example (2D-MSSA)
data(Barbara)
ss <- ssa(Barbara, L = c(50, 50, 1))
plot(reconstruct(ss, groups = 1), slice = list(k = 1))
## End(No test)



