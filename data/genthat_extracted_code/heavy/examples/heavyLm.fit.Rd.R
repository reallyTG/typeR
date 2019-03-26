library(heavy)


### Name: heavyLm.fit
### Title: Fitter functions for linear models under heavy-tailed
###   distributions
### Aliases: heavyLm.fit heavyMLm.fit
### Keywords: regression array

### ** Examples

# univariate linear regression
data(ereturns)
x <- cbind(1, ereturns$CRSP)
colnames(x) <- c("Intercept", "CRSP")
y <- ereturns$m.marietta
z <- heavyLm.fit(x = x, y = y)

# multivariate linear regression
data(dialyzer)
y <- as.matrix(dialyzer[,1:4])
n <- nrow(y)
x <- matrix(1, nrow = n, ncol = 1) # a vector of ones
z <- heavyMLm.fit(x = x, y = y)



