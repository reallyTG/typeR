library(mice)


### Name: pool.scalar
### Title: Multiple imputation pooling: univariate version
### Aliases: pool.scalar
### Keywords: htest

### ** Examples



imp <- mice(nhanes)
m <- imp$m
Q <- rep(NA, m)
U <- rep(NA, m)
for (i in 1:m) {
   Q[i] <- mean(complete(imp, i)$bmi)
   U[i] <- var(complete(imp, i)$bmi) / nrow(nhanes)  # (standard error of estimate)^2
}
pool.scalar(Q, U, n = nrow(nhanes), k = 1)  # Barnard-Rubin 1999




