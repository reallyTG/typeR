library(essHist)


### Name: essHist-package
### Title: The Essential Histogram
### Aliases: essHist-package essHist
### Keywords: package distribution nonparametric

### ** Examples

# Simulate data
set.seed(123)
n = 300
y = rnorm(n)

# Compute the essential histogram
eh = essHistogram(y, plot = FALSE)

# Plot results
#     compute oracle density
x  = seq(min(y), max(y), length.out = n)
od = dnorm(x)
#     compare with orcle density
plot(x, od, type = "l", xlab = NA, ylab = NA, col = "red")
lines(eh)
legend("topright", c("Oracle density", "Essential histogram"), 
       lty = c(1,1), col = c("red", "black"))

###########################################################

# Evaluate other method e.g. R default histogram function
# Data: mixture of Gaussians 1/3 N(0,0.5) + 1/3 N(5,1) + 1/3 N(15,2)
set.seed(123)
n = 300
y = rmixnorm(n, mean = c(0, 5, 15), sd = c(0.5, 1, 2))

# Oracle density
sy = sort(y)
ho = dmixnorm(sy, mean = c(0, 5, 15), sd = c(0.5, 1, 2))

# R default histogram
h  = hist(y, plot = FALSE)

# Check R default histogram to local multiscale constriants
b = checkHistogram(h, y)
lines(sy, ho, col = "red")
legend("topright", c("R-Histogram", "Truth"), col = c("black", "red"), lty = c(1,1))



