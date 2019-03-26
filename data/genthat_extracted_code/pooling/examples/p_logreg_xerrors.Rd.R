library(pooling)


### Name: p_logreg_xerrors
### Title: Poolwise Logistic Regression with Normal Exposure Subject to
###   Errors
### Aliases: p_logreg_xerrors

### ** Examples

# Load dataset containing (Y, Xtilde, C) values for pools of size 1, 2, and
# 3. Xtilde values are affected by processing error.
data(pdat1)

# Estimate log-OR for X and Y adjusted for C, ignoring processing error
fit1 <- p_logreg_xerrors(g = pdat1$g, y = pdat1$allcases,
                         xtilde = pdat1$xtilde, c = pdat1$c,
                         errors = "neither")
fit1$theta.hat

# Repeat, but accounting for processing error. Closer to true log-OR of 0.5.
fit2 <- p_logreg_xerrors(g = pdat1$g, y = pdat1$allcases,
                         xtilde = pdat1$xtilde, c = pdat1$c,
                         errors = "processing")
fit2$theta.hat





