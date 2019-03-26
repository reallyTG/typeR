library(dynfrail)


### Name: dynfrail_fit
### Title: Inner maximization of the log-likelihood
### Aliases: dynfrail_fit

### ** Examples

arglist1 <- dynfrail_prep(Surv(time, status) ~ rx + sex + cluster(litter),
data = rats)

# using list() inside is because of the way that R converts lists and vectors
mod1 <- do.call(dynfrail_fit, c(logfrailtypar = list(log(c(0.5, 0.1))), arglist1))



