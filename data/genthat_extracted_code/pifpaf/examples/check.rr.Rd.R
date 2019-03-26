library(pifpaf)


### Name: check.rr
### Title: Check Relative Risk
### Aliases: check.rr
### Keywords: internal

### ** Examples

X  <- data.frame(rnorm(100))
rr <- function(X, theta){exp(X*theta)}
check.rr(X, 1, rr)




