library(quantities)


### Name: quantities
### Title: Handle Measurement Units and Uncertainty on a Numeric Vector
### Aliases: quantities quantities<- set_quantities

### ** Examples

x = 1:3
class(x)
x
quantities(x) <- list("m/s", 0.1)
class(x)
x

(x <- set_quantities(x, m/s, seq(0.1, 0.3, 0.1)))




