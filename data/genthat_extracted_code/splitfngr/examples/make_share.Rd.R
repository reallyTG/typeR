library(splitfngr)


### Name: make_share
### Title: Convert a function from multiple function arguments to a single
###   function
### Aliases: make_share

### ** Examples

quad_share <- function(x){list(sum(x^4), 4*x^3)}
lbfgs_share <- make_share(lbfgs::lbfgs, 'call_eval', 'call_grad')
make_share(lbfgs::lbfgs, 'call_eval', 'call_grad')(quad_share, vars=c(5,-4))



