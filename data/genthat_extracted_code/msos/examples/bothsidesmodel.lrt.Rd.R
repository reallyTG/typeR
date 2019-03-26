library(msos)


### Name: bothsidesmodel.lrt
### Title: Test subsets of beta are zero.
### Aliases: bothsidesmodel.lrt

### ** Examples


# Load data
data(caffeine)

# Matrices
x <- cbind(rep(1, 28),
           c(rep(-1, 9), rep(0, 10), rep(1, 9)),
           c(rep(1, 9), rep(-1.8, 10), rep(1, 9))
          )
y <- caffeine[, -1]
z <- cbind(c(1, 1), c(1, -1))
pattern <- cbind(c(rep(1, 3)), 1)

# Fit model
bsm <- bothsidesmodel.lrt(x, y, z, pattern)




