library(pooling)


### Name: dfa_xerrors
### Title: Discriminant Function Approach for Estimating Odds Ratio with
###   Normal Exposure Subject to Measurement Error
### Aliases: dfa_xerrors

### ** Examples

# Load datasets - dat1 has (Y, C) values and dat1_xtilde is list with 1 or 2
# Xtilde measurements for each subject. Xtilde values are affected by
# measurement error.
data(dat1)
data(dat1_xtilde)

# Estimate log-OR for X and Y adjusted for C, ignoring measurement error
fit1 <- dfa_xerrors(y = dat1$y, xtilde = dat1_xtilde, c = dat1$c, merror = FALSE)
fit1$estimates

# Repeat, but accounting for measurement error. Closer to true log-OR of 0.5.
fit2 <- dfa_xerrors(y = dat1$y, xtilde = dat1_xtilde, c = dat1$c, merror = TRUE)
fit2$estimates





