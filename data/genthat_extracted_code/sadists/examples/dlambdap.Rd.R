library(sadists)


### Name: lambdap
### Title: The lambda prime distribution.
### Aliases: dlambdap lambdap plambdap qlambdap rlambdap
### Keywords: distribution

### ** Examples

rv <- rlambdap(100, 50, t=0.01)
d1 <- dlambdap(1, 50, t=0.01)
pv <- plambdap(rv, 50, t=0.01)
qv <- qlambdap(ppoints(length(rv)), 50, t=1)




