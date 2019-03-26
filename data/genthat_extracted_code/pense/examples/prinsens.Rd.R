library(pense)


### Name: prinsens
### Title: Principal Sensitivity Components
### Aliases: prinsens

### ** Examples

set.seed(12345)
n <- 50
n_out <- 6
p <- 500
beta <- c(2:5, numeric(p - 4))
x <- 1 + matrix(rnorm(n * p), ncol = p)
y <- x %*% beta  + rnorm(n)

# add outliers to y
y[seq_len(n_out)] <- rnorm(n_out, -100, 0.5)

# Compute Principal Sensitivity Components
pscs <- prinsens(
    x, y,
    alpha = 0.8,
    method = "en",
    lambda = 10
)

# The 6 outlying observations are reflected in the 15th PSC
colors <- rep.int(c(2, 1), times = c(n_out, n - n_out))
ord <- order(abs(pscs[, 15L]))
plot(abs(pscs[ord, 15L]), col = colors[ord], xlab = "Sorted Index",
     ylab = "Absolute PSC score")




