library(Rssa)


### Name: ssa-input
### Title: Input Data Formats Used by SSA Routines
### Aliases: ssa-input

### ** Examples

s <- ssa(co2) # Perform the decomposition using the default window length
r <- reconstruct(s, groups = list(Trend = c(1, 4),
                                  Seasonality = c(2, 3))) # Reconstruct into 2 series
class(r$Trend) # Result is 'ts' object

# Simultaneous trend extraction using MSSA
s <- ssa(EuStockMarkets, kind = "mssa")
r <- reconstruct(s, groups = list(Trend = c(1,2)))
class(r$Trend) # Result is 'mts' object

# Trend forecast
f <- rforecast(s, groups = list(Trend = c(1, 2)), len = 50, only.new = FALSE)
class(f) # For 'ts' objects the time scales are inferred automatically

# Artificial image for 2dSSA
mx <- outer(1:50, 1:50,
            function(i, j) sin(2*pi * i/17) * cos(2*pi * j/7) + exp(i/25 - j/20)) +
      rnorm(50^2, sd = 0.1)
# Decompose 'mx' with circular window
s <- ssa(mx, kind = "2d-ssa", wmask = circle(5), neig = 10)
# Reconstruct
r <- reconstruct(s, groups = list(1, 2:5))
# Plot components, original image and residuals
plot(r)

# 3D-SSA example (2D-MSSA)
data(Barbara)
## No test: 
ss <- ssa(Barbara, L = c(50, 50, 1))
plot(ss)
## End(No test)



