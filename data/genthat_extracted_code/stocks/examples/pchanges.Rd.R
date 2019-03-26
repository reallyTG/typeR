library(stocks)


### Name: pchanges
### Title: Lagged Proportion Changes
### Aliases: pchanges

### ** Examples

# Generate 10 values from N(0, 1)
x <- rnorm(10)

# Calculate vector of proportion changes between subsequent values
(y <- pchanges(x))

# Equivalent base R computation
len <- length(x)
p1 <- x[2: len] 
p2 <- x[1: (len - 1)] 
y2 <- p1 / p2 - 1
all.equal(y, y2)





