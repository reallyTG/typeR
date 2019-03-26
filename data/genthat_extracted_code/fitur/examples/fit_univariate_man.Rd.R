library(fitur)


### Name: fit_univariate_man
### Title: Fit Univariate Distributions by Specifying Parameters
### Aliases: fit_univariate_man

### ** Examples

manFun <- fit_univariate_man('norm', c(mean = 2, sd = 5))
set.seed(5)
m1 <- mean(manFun$rnorm(100000))
set.seed(5)
m2 <- mean(rnorm(100000, 2, 5))
identical(m1, m2)



