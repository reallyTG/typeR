library(dynutils)


### Name: inherit_default_params
### Title: Inherit default parameters from a list of super functions
### Aliases: inherit_default_params

### ** Examples

fun1 <- function(a = 10, b = 7) runif(a, -b, b)
fun2 <- function(c = 9) 2^c

fun3 <- inherit_default_params(
  super = list(fun1, fun2),
  fun = function(a, b, c) {
    list(x = fun1(a, b), y = fun2(c))
  }
)

fun3



