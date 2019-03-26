library(Rssa)


### Name: plot
### Title: Plot SSA object
### Aliases: plot.ssa

### ** Examples

## No test: 
# Decompose 'co2' series with default parameters
s <- ssa(co2)
# Plot the eigenvalues
plot(s, type = "values")
# Plot W-cor matrix for first 10 reconstructed components
plot(s, type = "wcor", groups = 1:10)
# Plot the paired plot for first 6 eigenvectors
plot(s, type = "paired", idx = 1:6)
# Plot eigenvectors for first 6 components
plot(s, type = "vectors", idx = 1:6)
# Plot the first 4 reconstructed components
plot(s, type = "series", groups = list(1:4))
# Plot the eigenvalues by points only
plot(s, type = "values", plot.type = "p")

# Artificial image for 2dSSA
mx <- outer(1:50, 1:50,
            function(i, j) sin(2*pi * i/17) * cos(2*pi * j/7) + exp(i/25 - j/20)) +
      rnorm(50^2, sd = 0.1)
# Decompose 'mx' with default parameters
s <- ssa(mx, kind = "2d-ssa")
# Plot the eigenvalues
plot(s, type = "values")
# Plot eigenvectors for first 6 components
plot(s, type = "vectors", idx = 1:6,
     ref = TRUE, at = "same", cuts = 50,
     plot.contrib = TRUE, symmetric = TRUE)
# Plot factor vectors for first 6 components
plot(s, type = "vectors", vectors = "factor", idx = 1:6,
     ref = TRUE, at = "same", cuts = 50,
     plot.contrib = TRUE, symmetric = TRUE)
# Plot wcor for first 12 components
plot(s, type = "wcor", groups = 1:12, grid = c(2, 6))

# 3D-SSA example (2D-MSSA)
data(Barbara)
ss <- ssa(Barbara, L = c(50, 50, 1))
plot(ss, type = "values")
plot(ss, type = "vectors", idx = 1:12, slice = list(k = 1),
     cuts = 50, plot.contrib = TRUE)
plot(ss, type = "vectors", idx = 1:12, slice = list(k = 1, i = 1))
plot(ss, type = "vectors", vectors = "factor", idx = 1:12, slice = list(k = 3),
     cuts = 50, plot.contrib = FALSE)
plot(ss, type = "series", groups = 1:12, slice = list(k = 1))
plot(ss, type = "series", groups = 1:12, slice = list(k = 1, i = 1))
plot(ss, plot.method = "xyplot", type = "series", groups = 1:12, slice = list(k = 1, i = 1))
## End(No test)



