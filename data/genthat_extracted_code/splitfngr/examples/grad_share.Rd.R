library(splitfngr)


### Name: grad_share
### Title: Split function and gradient calculation
### Aliases: grad_share

### ** Examples

quad_share <- function(x){list(sum(x^4), 4*x^3)}
share <- grad_share(quad_share)
share$fn(1)
share$gr(1)
share$gr(2)
share$fn(2)
share$gr(2)



