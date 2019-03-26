library(pooling)


### Name: p_logreg
### Title: Poolwise Logistic Regression
### Aliases: p_logreg

### ** Examples

# Load dataset containing (Y, Xtilde, C) values for pools of size 1, 2, and 3
data(pdat1)

# Estimate log-OR for Xtilde and Y adjusted for C
fit <- p_logreg(g = pdat1$g, y = pdat1$allcases, x = pdat1[, c("xtilde", "c")])
fit$theta.hat





