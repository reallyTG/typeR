library(simsalapar)


### Name: doCallWE
### Title: Innermost Computation: Error Catching Version of do.call()
### Aliases: doCallWE mkTimer
### Keywords: programming

### ** Examples

set.seed(61)
L <- log(abs(rt(n=100, df = 1.5)))
r <- doCallWE(quantile, list(L, probs= 0.95))
## set timer for  "no timing" :
u <- doCallWE(quantile, list(L, probs= 0.95), timer = function(E) { E; NULL })
stopifnot(is.null(r$error),
	  all.equal(r$value, quantile(L, 0.95)),
	  identical(r[1:3], u[1:3]), is.null(u[["time"]]))



