library(quantreg)


### Name: summary.rqss
### Title: Summary of rqss fit
### Aliases: summary.rqss print.summary.rqss
### Keywords: regression smooth robust

### ** Examples

n <- 200
x <- sort(rchisq(n,4))
z <- x + rnorm(n)
y <- log(x)+ .1*(log(x))^2 + log(x)*rnorm(n)/4 + z
f  <- rqss(y ~ qss(x) + z)
summary(f)



