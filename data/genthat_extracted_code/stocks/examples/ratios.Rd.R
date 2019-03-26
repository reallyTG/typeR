library(stocks)


### Name: ratios
### Title: Ratios of Subsequent Elements in a Vector
### Aliases: ratios

### ** Examples

# Generate 10 values from N(0, 1)
x <- rnorm(10)

# Calculate vector of ratios
(y <- ratios(x))

# Slower base R computation
len <- length(x)
y2 <- x[2: len] / x[1: (len - 1)]
all.equal(y, y2)





