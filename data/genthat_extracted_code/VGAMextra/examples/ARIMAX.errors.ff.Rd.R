library(VGAMextra)


### Name: ARIMAX.errors.ff
### Title: VGLTSMs Family Functions: Generalized integrated regression with
###   order-(p, q) ARMA errors
### Aliases: ARIMAX.errors.ff

### ** Examples

### Estimate a regression model with ARMA(1, 1) errors.
## Covariates are included up to lag 1.
set.seed(20171123)
nn <- 250
x2 <- rnorm(nn)                                    # One covariate
sigma2 <- exp(1.15); theta1 <- 0.5; phi1 <- 0.27   # True coefficients
beta0  <- 1.25; beta1 <- 0.25; beta2 <- 0.5

y <- numeric(nn)
u <- numeric(nn)
z <- numeric(nn)

u[1] <- rnorm(1)
z[1] <- rnorm(1, 0, sqrt(sigma2))

for(ii in 2:nn) {
  z[ii] <- rnorm(1, 0, sqrt(sigma2))
  u[ii] <- theta1 * u[ii - 1] + phi1 * z[ii - 1] + z[ii]
  y[ii] <- beta0 + beta1 * x2[ii] + beta2 * x2[ii - 1] + u[ii]
}

# Remove warm-up values.
x2 <- x2[-c(1:100)]
y  <- y[-c(1:100)]

## No test: 
plot(ts(y), lty = 2, col = "blue", type = "b")
abline(h = 0, lty = 2)
## End(No test)

## Fit the model.
ARIMAX.reg.fit <- vglm(y ~ x2, ARIMAX.errors.ff(order = c(1, 0, 1), xLag = 1),
             data = data.frame(y = y, x2 = x2), trace = TRUE)
coef(ARIMAX.reg.fit, matrix = TRUE)
summary(ARIMAX.reg.fit, HD = FALSE)

## No test: 
# Compare to arima()
# arima() can't handle lagged values of 'x2' by default, but these 
# may entered at argument 'xreg'.
arima(y, order = c(1, 0, 1), xreg = cbind(x2, c(0, x2[-150])))
## End(No test)





