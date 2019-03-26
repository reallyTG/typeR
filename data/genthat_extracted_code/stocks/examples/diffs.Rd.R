library(stocks)


### Name: diffs
### Title: Lagged Differences (Alternate Implementation)
### Aliases: diffs

### ** Examples

# Generate 1 million values from Poisson(3) distribution
x <- rpois(100000, 3)

# Calculate vector of differences between subsequent values
y <- diffs(x)

# Could get same result from base R function diff
z <- diff(x)
all.equal(y, z)

# But diffs is faster
benchmark(diffs(x), diff(x), replications = 100)





