library(roptim)


### Name: example3_flb_25_dims_box_con
### Title: Example 3: Minimize a function using L-BFGS-B with
###   25-dimensional box constrained
### Aliases: example3_flb_25_dims_box_con

### ** Examples

flb <- function(x)
{ p <- length(x); sum(c(1, rep(4, p-1)) * (x - c(1, x[-p])^2)^2) }
## 25-dimensional box constrained
optim(rep(3, 25), flb, NULL, method = "L-BFGS-B",
     lower = rep(2, 25), upper = rep(4, 25)) # par[24] is *not* at boundary

## corresponding C++ implementation:
example3_flb_25_dims_box_con()



