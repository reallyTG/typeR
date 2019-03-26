library(nlr)


### Name: nl.form-class
### Title: Class '"nl.form"'
### Aliases: nl.form nl.form-class $,nl.form-method $<-,nl.form-method
###   [<-,nl.form,ANY,ANY,ANY-method all.vars,nl.form-method
###   eval,nl.form-method eval.nl.form evald,nl.form-method
###   getInitial,nl.form-method selfStart,nl.form-method
### Keywords: classes nl.form

### ** Examples

# define hampel robust loss as a function
hampel <- nl.form(
	  form = function(t,
	                  a = 1.345,
	                  k0 = 3.73677,
	                  k1 = 4,
	                  maxrho5 = 1.345,
	                  ...) {
	    U <- abs(t)
	    Ugrta <- (U > abs(a))
	    .rho <- .grad <- .hess <- .weight <- NULL
	    .rho[Ugrta] <- 2. * abs(a) * U[Ugrta] - a * a
	    .rho[!Ugrta] <- t[!Ugrta] ^ 2
	    .grad[Ugrta] <- 2. * abs(a) * sign(t[Ugrta])
	    .grad[!Ugrta] <- 2. * t[!Ugrta]
	    .hess[Ugrta] <- 0.
	    .hess[!Ugrta] <- 2.
	    .weight[Ugrta] <- 2. * abs(a) / U[Ugrta]
	    .weight[!Ugrta] <- 2.
	    attr(.rho, "gradient") <- .grad
	    attr(.rho, "hessian") <- .hess
	    attr(.rho, "weight") <- .weight
	    return(.rho)
	  },
	  name = "huber",
	  independent = "t",
	  a = 1.345,
	  k0 = 3.73677,
	  k1 = 4,
	  maxrho5 = 1.345
	)



