library(pooling)


### Name: p_dfa_xerrors
### Title: Discriminant Function Approach for Estimating Odds Ratio with
###   Normal Exposure Measured in Pools and Subject to Errors
### Aliases: p_dfa_xerrors

### ** Examples

# Load dataset containing poolwise (Y, Xtilde, C) values for pools of size
# 1, 2, and 3. Xtilde values are affected by processing error.
data(pdat1)

# Estimate log-OR for X and Y adjusted for C, ignoring processing error
fit1 <- p_dfa_xerrors(g = pdat1$g, y = pdat1$numcases, xtilde = pdat1$xtilde,
                      c = pdat1$c, errors = "neither")
fit1$estimates

# Repeat, but accounting for processing error. Closer to true log-OR of 0.5.
fit2 <- p_dfa_xerrors(g = pdat1$g, y = pdat1$numcases, xtilde = pdat1$xtilde,
                      c = pdat1$c, errors = "processing")
fit2$estimates





