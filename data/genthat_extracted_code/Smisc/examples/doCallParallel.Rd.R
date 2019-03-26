library(Smisc)


### Name: doCallParallel
### Title: Call a function with a vectorized input in parallel
### Aliases: doCallParallel

### ** Examples

# Get a vector of x's
x <- rnorm(18, mean = 2, sd = 2)

# 2 cores
y1 <- doCallParallel("pnorm", x, mean = 2, sd = 2, njobs = 2)

# 2 cores and randomization
y2 <- doCallParallel(pnorm, x, mean = 2, sd = 2, njobs = 2, random.seed = 1)

# Without using doCallParallel()
y3 <- pnorm(x, mean = 2, sd = 2)

# Comparisons
identical(y1, y2)
identical(y1, y3)



