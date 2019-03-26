library(pooling)


### Name: logreg_xerrors
### Title: Logistic Regression with Normal Exposure Subject to Errors
### Aliases: logreg_xerrors

### ** Examples

# Load dataset - dat1 has (Y, C) values and dat1_xtilde is list with 1 or 2
# Xtilde measurements for each subject.
data(dat1)
data(dat1_xtilde)

# Estimate log-OR for X and Y adjusted for C, ignoring measurement error
fit1 <- logreg_xerrors(y = dat1$y, xtilde = dat1_xtilde, c = dat1$c,
                       merror = FALSE)
fit1$theta.hat

# Repeat, but accounting for measurement error. Closer to true log-OR of 0.5.
fit2 <- logreg_xerrors(y = dat1$y, xtilde = dat1_xtilde, c = dat1$c,
                       merror = TRUE)
fit2$theta.hat





