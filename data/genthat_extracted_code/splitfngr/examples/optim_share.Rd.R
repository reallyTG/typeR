library(splitfngr)


### Name: optim_share
### Title: Use splitfngr with optim
### Aliases: optim_share

### ** Examples

quad_share <- function(x){list(sum(x^4), 4*x^3)}
optim_share(par=c(3, -5), quad_share, method="BFGS")



