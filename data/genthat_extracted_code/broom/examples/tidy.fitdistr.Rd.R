library(broom)


### Name: tidy.fitdistr
### Title: Tidy a(n) fitdistr object
### Aliases: tidy.fitdistr fitdistr_tidiers

### ** Examples


set.seed(2015)
x <- rnorm(100, 5, 2)

library(MASS)
fit <- fitdistr(x, dnorm, list(mean = 3, sd = 1))

tidy(fit)
glance(fit)




