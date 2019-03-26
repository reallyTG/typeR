library(logspline)


### Name: logspline
### Title: Logspline Density Estimation
### Aliases: logspline
### Keywords: distribution smooth

### ** Examples

y <- rnorm(100)
fit <- logspline(y)       
plot(fit)
#
# as (4 == length(-2, -1, 0, 1, 2) -1), this forces these initial knots,
# and does no knot selection
fit <- logspline(y, knots = c(-2, -1, 0, 1, 2), maxknots = 4, penalty = 0)  
#
# the following example give one of the rare examples where logspline
# crashes, and this shows the use of error.action = 2.
#
set.seed(118)
zz <- rnorm(300)
zz[151:300] <- zz[151:300]+5
zz <- round(zz)
fit <- logspline(zz)
#
# you could rerun this with 
# fit <- logspline(zz, error.action=0)
# or
# fit <- logspline(zz, error.action=1)



