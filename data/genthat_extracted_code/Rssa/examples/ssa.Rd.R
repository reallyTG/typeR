library(Rssa)


### Name: ssa
### Title: Create a new SSA object
### Aliases: ssa new.ssa

### ** Examples

# Decompose 'co2' series with default parameters
s <- ssa(co2)
# Show the summary
summary(s)
# Reconstruct the series, with suitable grouping
r <- reconstruct(s, groups = list(c(1, 4), c(2, 3), c(5, 6)))
## No test: 
plot(r)
## End(No test)

# Decompose 'EuStockMarkets' series with default parameters
s <- ssa(EuStockMarkets, kind = "mssa")
r <- reconstruct(s, groups = list(Trend = 1:2))
# Plot original series, trend and residuals superimposed
## No test: 
plot(r, plot.method = "xyplot", superpose = TRUE,
     auto.key = list(columns = 3),
     col = c("blue", "green", "red", "violet"),
     lty = c(rep(1, 4), rep(2, 4), rep(3, 4)))
## End(No test)

# Artificial image for 2dSSA
mx <- outer(1:50, 1:50,
            function(i, j) sin(2*pi * i/17) * cos(2*pi * j/7) + exp(i/25 - j/20)) +
      rnorm(50^2, sd = 0.1)
# Decompose 'mx' with circular window
s <- ssa(mx, kind = "2d-ssa", wmask = circle(5), neig = 10)
# Reconstruct
r <- reconstruct(s, groups = list(1, 2:5))
## No test: 
# Plot components, original image and residuals
plot(r)
## End(No test)

# Real example: Mars photo
data(Mars)
# Decompose only Mars image (without backgroud)
s <- ssa(Mars, mask = Mars != 0, wmask = circle(50), kind = "2d-ssa")
## No test: 
# Plot eigenarrays
plot(s, type = "vectors", idx = 1:25)
# Plot factor arrays
plot(s, type = "vectors", vectors = "factor", idx = 1:25)
# Reconstruct and plot trend
plot(reconstruct(s, 1), fill.uncovered = "original")
# Reconstruct and plot texture pattern
plot(reconstruct(s, groups = list(c(13,14, 17, 18))))

# I()-wrapper demo
circle <- 50
s <- ssa(Mars, wmask = circle(R = I(circle)))

# CSSA-based trend extraction
s <- ssa(EuStockMarkets[, 1] + 1.0i*EuStockMarkets[, 2], kind = "cssa")
r <- reconstruct(s, groups = list(Trend = 1:2))
plot(r)

# `co2' decomposition with double projection to linear functions
s <- ssa(co2, column.projector = "centering", row.projector = "centering")
plot(reconstruct(s, groups = list(trend = seq_len(nspecial(s)))))
## End(No test)

# Artificial 2d example with double projection
ii <- matrix(1:100, 100, 100); jj <- t(ii)
x <- ii + 2 * jj
s <- ssa(x, column.projector = "centering", row.projector = "centering")
plot(s)
plot(reconstruct(s, groups = list(trend = seq_len(nspecial(s)))))

# 3D-SSA example (2D-MSSA)
data(Barbara)
Barbara.noised <- Barbara

# Corrupt image by regular noise
noise <- outer(seq_len(dim(Barbara)[1]),
               seq_len(dim(Barbara)[2]),
               function(i, j) sin(2*pi * (i/13 + j/23)))
Barbara.noised[,, 1] <- Barbara.noised[,, 1] + 10 * noise
Barbara.noised[,, 2] <- Barbara.noised[,, 2] + 30 * noise
Barbara.noised[,, 3] <- Barbara.noised[,, 3] + 5 * noise

# Normalize image for plotting
Barbara.noised <- (Barbara.noised - min(Barbara.noised)) / diff(range(Barbara.noised))

plot(c(0, 1), c(0, 1), type = "n", xlab = "", ylab = "")
rasterImage(Barbara.noised, 0, 0, 1, 1, interpolate = FALSE)

## No test: 
# Multichannel 2D-SSA
ss <- ssa(Barbara.noised, L = c(50, 50, 1))
plot(ss, type = "series", groups = 1:18, slice = list(k = 1))
plot(ss, type = "vectors", idx = 1:12, slice = list(k = 1))
plot(ss, type = "vectors", vectors = "factor", idx = 1:12, slice = list(k = 3))
# Denoise image
Barbara.rec <- residuals(ss, groups = 5:6)
plot(c(0, 1), c(0, 1), type = "n", xlab = "", ylab = "")
rasterImage(Barbara.rec, 0, 0, 1, 1, interpolate = FALSE)
## End(No test)



