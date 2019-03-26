library(R2BayesX)


### Name: write.bayesx.input
### Title: Write the BayesX Program
### Aliases: write.bayesx.input
### Keywords: regression

### ** Examples

## generate some data
set.seed(111)
n <- 500

## regressors
dat <- data.frame(x = runif(n, -3, 3), z = runif(n, -3, 3),
   w = runif(n, 0, 6), fac = factor(rep(1:10, n/10)))

## response
dat$y <- with(dat, 1.5 + sin(x) + cos(z) * sin(w) +
   c(2.67, 5, 6, 3, 4, 2, 6, 7, 9, 7.5)[fac] + rnorm(n, sd = 0.6))

## create BayesX .prg
pars <- parse.bayesx.input(y ~ sx(x) + sx(z, w, bs = "te") + fac,
  data = dat)
prg <- write.bayesx.input(pars)
print(prg)

## have a look at the generated files
## which are used within BayesX
print(list.files(paste(tempdir(), "/bayesx", sep = "")))



