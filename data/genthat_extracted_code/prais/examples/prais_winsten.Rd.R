library(prais)


### Name: prais_winsten
### Title: Prais-Winsten Estimator for AR(1) Serial Correlation
### Aliases: prais_winsten print.prais

### ** Examples

# Generate an artificial sample
set.seed(1234567)
n <- 100
x <- sample(20:40, n, replace = TRUE)
rho <- .5

# AR(1) errors
u <- rnorm(n, 0, 5)
for (i in 2:n) {
  u[i] <- u[i] + rho * u[i - 1]
}
pw_sample <- data.frame("x" = x, "y" = 10 + 1.5 * x + u)

# Estimate
pw <- prais_winsten(y ~ x, data = pw_sample)
summary(pw)




