library(Rssa)


### Name: wcor
### Title: Calculate the W-correlation matrix
### Aliases: wcor wcor.ssa wcor.ossa wcor.default plot.wcor.matrix

### ** Examples

# Decompose co2 series with default parameters
s <- ssa(co2)
# Calculate the w-correlation matrix between first 20 series
# for a guess for grouping
w <- wcor(s, groups = 1:20)
plot(w, grid = c(2,4, 5,7))
# Calculate the w-correlation matrix for the chosen groups
# to check separability
w <- wcor(s, groups = list(c(1,4), c(2,3), c(5,6)))

## No test: 
# Artificial image for 2D SSA
mx <- outer(1:50, 1:50,
            function(i, j) sin(2*pi * i/17) * cos(2*pi * j/7) + exp(i/25 - j/20)) +
      rnorm(50^2, sd = 0.1)
# Decompose 'mx' with default parameters
s <- ssa(mx, kind = "2d-ssa")
# Plot wcor for first 12 components
plot(wcor(s, groups = 1:12), grid = c(2, 6))

# Real example: Mars photo
data(Mars)
# Decompose only Mars image (without backgroud)
s <- ssa(Mars, mask = Mars != 0, wmask = circle(50), kind = "2d-ssa")
# Plot wcor for the first 25 components
plot(wcor(s, groups = 1:25), grid = c(13, 15, 17,19))
## End(No test)



