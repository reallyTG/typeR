library(stocks)


### Name: pdiffs
### Title: Lagged Proportion Differences
### Aliases: pdiffs

### ** Examples

# Generate 10 values from N(0, 1)
x <- rnorm(10)

# Calculate vector of proportion differences between subsequent values
(y <- pdiffs(x))

# Equivalent base R computation
len <- length(x) 
p1 <- x[2: len]
p2 <- x[1: (len - 1)]
y2 <- (p1 - p2) / (0.5 * (p1 + p2))
all.equal(y, y2)





