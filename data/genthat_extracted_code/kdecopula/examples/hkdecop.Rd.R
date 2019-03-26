library(kdecopula)


### Name: hkdecop
### Title: H-function and inverse of a 'kdecop()' fit
### Aliases: hkdecop

### ** Examples

## load data and transform with empirical cdf
data(wdbc)
udat <- apply(wdbc[, -1], 2, function(x) rank(x) / (length(x) + 1))

## estimation of copula density of variables 5 and 6
fit <- kdecop(udat[, 5:6])
plot(fit) 

## evaluate h-function estimate and its inverse at (u1|u2) = (0.123 | 0.321)
hkdecop(c(0.123, 0.321), fit, cond.var = 2) 
hkdecop(c(0.123, 0.321), fit, cond.var = 2, inverse = TRUE) 




