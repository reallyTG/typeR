library(Deriv)


### Name: Deriv
### Title: Symbollic differentiation of an expression or function
### Aliases: Deriv drule

### ** Examples


## Not run: f <- function(x) x^2
## Not run: Deriv(f)
# function (x)
# 2 * x

## Not run: f <- function(x, y) sin(x) * cos(y)
## Not run: Deriv(f)
# function (x, y)
# c(x = cos(x) * cos(y), y = -(sin(x) * sin(y)))

## Not run: f_ <- Deriv(f)
## Not run: f_(3, 4)
#              x         y
# [1,] 0.6471023 0.1068000

## Not run: Deriv(~ f(x, y^2), "y")
# -(2 * (y * sin(x) * sin(y^2)))

## Not run: Deriv(quote(f(x, y^2)), c("x", "y"), cache.exp=FALSE)
# c(x = cos(x) * cos(y^2), y = -(2 * (y * sin(x) * sin(y^2))))

## Not run: Deriv(expression(sin(x^2) * y), "x")
# expression(2*(x*y*cos(x^2)))

Deriv("sin(x^2) * y", "x") # differentiate only by x
"2 * (x * y * cos(x^2))"

Deriv("sin(x^2) * y", cache.exp=FALSE) # differentiate by all variables (here by x and y)
"c(x = 2 * (x * y * cos(x^2)), y = sin(x^2))"

# Compound function example (here abs(x) smoothed near 0)
fc <- function(x, h=0.1) if (abs(x) < h) 0.5*h*(x/h)**2 else abs(x)-0.5*h
Deriv("fc(x)", "x", cache.exp=FALSE)
"if (abs(x) < h) x/h else sign(x)"

# Example of a first argument that cannot be evaluated in the current environment:
## Not run: 
##D   suppressWarnings(rm("xx", "yy"))
##D   Deriv(xx^2+yy^2)
## End(Not run)
# c(xx = 2 * xx, yy = 2 * yy)

# Automatic differentiation (AD), note itermediate variable 'd' assignment
## Not run: Deriv(~{d <- ((x-m)/s)^2; exp(-0.5*d)}, "x")
#{
#   d <- ((x - m)/s)^2
#   .d_x <- 2 * ((x - m)/s^2)
#   -(0.5 * (.d_x * exp(-(0.5 * d))))
#}

# Custom derivation rule
## Not run: 
##D   myfun <- function(x, y=TRUE) NULL # do something usefull
##D   dmyfun <- function(x, y=TRUE) NULL # myfun derivative by x.
##D   drule[["myfun"]] <- alist(x=dmyfun(x, y), y=NULL) # y is just a logical
##D   Deriv(myfun(z^2, FALSE), "z")
##D   # 2 * (z * dmyfun(z^2, FALSE))
## End(Not run)
# Differentiantion by list components
## Not run: 
##D   theta <- list(m=0.1, sd=2.)
##D   x <- names(theta)
##D   names(x)=rep("theta", length(theta))
##D   Deriv(~exp(-(x-theta$m)**2/(2*theta$sd)), x, cache.exp=FALSE)
##D # c(theta_m = exp(-((x - theta$m)^2/(2 * theta$sd))) *
##D #  (x - theta$m)/theta$sd, theta_sd = 2 * (exp(-((x - theta$m)^2/
##D #  (2 * theta$sd))) * (x - theta$m)^2/(2 * theta$sd)^2))
## End(Not run)



