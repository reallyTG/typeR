library(errors)


### Name: errors
### Title: Handle Uncertainty on a Numeric Vector
### Aliases: errors errors_max errors_min errors<- set_errors as.errors

### ** Examples

x = 1:3
class(x)
x
errors(x) <- 0.1
class(x)
x

(x <- set_errors(x, seq(0.1, 0.3, 0.1)))
errors_max(x)
errors_min(x)




