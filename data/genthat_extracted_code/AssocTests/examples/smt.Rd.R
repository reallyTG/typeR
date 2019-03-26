library(AssocTests)


### Name: smt
### Title: Single-marker test
### Aliases: smt

### ** Examples

y <- rep(c(0, 1), 25)
g <- sample(c(0, 1, 2), 50, replace = TRUE)
smt(y, g, covariates = NULL, min.count=5,
        missing.rate=0.20, y.continuous = FALSE)



