library(splitfngr)


### Name: lbfgs_share
### Title: Use splitfngr with lbfgs
### Aliases: lbfgs_share

### ** Examples

quad_share <- function(x){list(sum(x^4), 4*x^3)}
lbfgs_share(vars=c(3, -5), fngr=quad_share)



