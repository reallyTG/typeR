library(robustX)


### Name: L1median
### Title: Compute the Multivariate L1-Median
### Aliases: L1median optimMethods nlminbMethods
### Keywords: robust multivariate

### ** Examples

data(stackloss)
L1median(stackloss)
L1median(stackloss, method = "HoCrJo")

## Explore all methods:
m <- eval(formals(L1median)$method); allMeths <- m[m != "Brent"]
L1m <- sapply(allMeths, function(meth) L1median(stackloss, method = meth))
## --> with a warning for L-BFGS-B
str(L1m)
pm <- sapply(L1m, function(.) if(is.numeric(.)) . else .$par)
t(pm) # SANN differs a bit; same objective ?



