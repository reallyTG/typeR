library(Zelig)


### Name: combine_coef_se
### Title: Combines estimated coefficients and associated statistics from
###   models estimated with multiply imputed data sets or bootstrapped
### Aliases: combine_coef_se

### ** Examples

set.seed(123)

## Multiple imputation example
# Create fake imputed data
n <- 100
x1 <- runif(n)
x2 <- runif(n)
y <- rnorm(n)
data.1 <- data.frame(y = y, x = x1)
data.2 <- data.frame(y = y, x = x2)

# Estimate model
mi.out <- to_zelig_mi(data.1, data.2)
z.out.mi <- zelig(y ~ x, model = "ls", data = mi.out)

# Combine and extract coefficients and standard errors
combine_coef_se(z.out.mi)

## Bootstrap example
z.out.boot <- zelig(y ~ x, model = "ls", data = data.1, bootstrap = 20)
combine_coef_se(z.out.boot)




