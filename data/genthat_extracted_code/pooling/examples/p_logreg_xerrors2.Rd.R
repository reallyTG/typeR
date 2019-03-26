library(pooling)


### Name: p_logreg_xerrors2
### Title: Poolwise Logistic Regression with Gamma Exposure Subject to
###   Errors
### Aliases: p_logreg_xerrors2

### ** Examples

# Load datasets - pdat2 has poolwise (Y, Xtilde) values and pdat2_c has
# individual-level C values. Xtilde values are affected by processing error.
data(pdat2)
data(pdat2_c)

# Estimate log-OR for X and Y adjusted for C, ignoring processing error
fit1 <- p_logreg_xerrors2(g = pdat2$g, y = pdat2$y, xtilde = pdat2$xtilde,
                          c = pdat2_c, errors = "neither")
fit1$theta.hat

# Repeat, but accounting for processing error. Takes about 1 minute to run
# due to numerical integration. Gives log-OR closer to true value of 0.5.
# fit2 <- p_logreg_xerrors2(g = pdat2$g, y = pdat2$y, xtilde = pdat2$xtilde,
#                           c = pdat2_c, errors = "processing",
#                           control = list(trace = 1))
# fit2$theta.hat





