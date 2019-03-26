library(stepR)


### Name: bounds
### Title: Bounds based on MRC
### Aliases: [.bounds bounds bounds.MRC
### Keywords: nonparametric

### ** Examples

y <- rnorm(100, c(rep(0, 50), rep(1, 50)), 0.5)
b <- computeBounds(y, q = 4, intervalSystem = "dyaLen", penalty = "none")
b <- b[order(b$li, b$ri), ]
attr(b, "row.names") <- seq(along = b$li)

# entries in bounds are recovered by computeBounds
all.equal(bounds(y, q = 4)$bounds, b) # TRUE


# simulate signal of 100 data points
Y <- rpois(100, 1:100 / 10)
# compute bounds for intervals of dyadic lengths
b <- bounds(Y, penalty="len", family="poisson", q=4)
# compute bounds for all intervals
b <- bounds(Y, penalty="len", family="poisson", q=4, lengths=1:100)



