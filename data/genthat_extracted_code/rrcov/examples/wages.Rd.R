library(rrcov)


### Name: wages
### Title: Wages and Hours
### Aliases: wages
### Keywords: datasets

### ** Examples

    data(wages)
    names(wages)
    x <- as.matrix(wages)
    ok <- is.finite(x %*% rep(1, ncol(x)))
    wages <- wages[ok, , drop = FALSE]
    wages.lm <- lm(HRS~AGE, data=wages)
    plot(HRS ~ AGE, data = wages)
    abline(wages.lm)
    class(wages.lm)
    names(wages.lm)
    summary(wages.lm)
    
    wages.mm <- lmrob(HRS~AGE, data=wages)
    plot(HRS ~ AGE, data = wages)
    abline(wages.mm)
    class(wages.mm)
    names(wages.mm)
    summary(wages.mm)   



