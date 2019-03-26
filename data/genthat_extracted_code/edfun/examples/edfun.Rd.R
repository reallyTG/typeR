library(edfun)


### Name: edfun
### Title: Creating Empirical Distribution Functions
### Aliases: edfun

### ** Examples


set.seed(2016-08-18)
x <- rnorm(100)
x_funs <- edfun(x)
x_funs$qfun(0) # -2.6

# for extreme cases, we can add the support vector
x_funs <- edfun(x, support = c(-Inf, Inf))
x_funs$qfun(0) # -Inf

f <- x_funs$dfun
curve(f, -2,2)

f <- x_funs$pfun
curve(f, -2,2)

f <- x_funs$qfun
curve(f, 0,1)

f <- x_funs$rfun
hist(f(1000))






