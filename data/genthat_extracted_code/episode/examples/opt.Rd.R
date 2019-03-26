library(episode)


### Name: opt
### Title: Create 'opt' (optimisation) object
### Aliases: opt

### ** Examples


# Generate some data
set.seed(123)
A <- matrix(c(1, 0, 1,
              1, 1, 0), byrow = TRUE, nrow = 2)
p <- plk(A)
x0 <- c(10, 4, 1)
theta <- matrix(c(0, -0.25,
                  0.75, 0,
                  0, -0.1), byrow = TRUE, nrow = 3)
Time <- seq(0, 1, by = .025)
y <- numsolve(p, Time, x0, theta)
y[, -1] <- y[, -1] + matrix(rnorm(prod(dim(y[, -1])), sd = .1), nrow = nrow(y))

# Minimally, you need to supply data:
op <- opt(y)

# More weight on early observations
w <- outer(1 / seq_len(nrow(y)), rep(1, length(x0)))
op <- opt(y, weights = w)

# Less weight on first coordinate
w <- outer(rep(1, nrow(y)), c(1, 2, 2))
op <- opt(y, weights = w)

# Adjust tuning parameter sequence
op <- opt(y, nlambda = 10, lambda_min_ratio = 0.05)




