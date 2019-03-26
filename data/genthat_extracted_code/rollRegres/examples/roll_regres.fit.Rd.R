library(rollRegres)


### Name: roll_regres.fit
### Title: Fitter Function for Rolling and Expanding Linear Models
### Aliases: roll_regres.fit

### ** Examples

# simulate data
set.seed(9623556)
n <- 50
p <- 2
X <- cbind(1, matrix(rnorm(p * n), ncol = p))
y <- drop(X %*% c(1, -1, 1)) + rnorm(n)

# compute coefs
out <- roll_regres.fit(x = X, y = y, width = 45L)
tail(out$coefs)




