library(rollRegres)


### Name: roll_regres
### Title: Fitting Rolling and Expanding Linear Models
### Aliases: roll_regres

### ** Examples

# simulate data
set.seed(29132867)
n <- 50
p <- 2
X <- cbind(1, matrix(rnorm(p * n), ncol = p))
y <- drop(X %*% c(1, -1, 1)) + rnorm(n)
df <- data.frame(y, X[, -1])

# compute coefs
out <- roll_regres(y ~ X1 + X2, df, width = 45L)
tail(out$coefs)

# compute more output
out <- roll_regres(
 y ~ X1 + X2, df, width = 45L,
 do_compute = c("sigmas", "r.squareds", "1_step_forecasts"))
lapply(out, tail)




