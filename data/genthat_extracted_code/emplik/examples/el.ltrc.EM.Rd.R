library(emplik)


### Name: el.ltrc.EM
### Title: Empirical likelihood ratio for mean with left truncated and
###   right censored data, by EM algorithm
### Aliases: el.ltrc.EM
### Keywords: nonparametric survival htest

### ** Examples

## example with tied observations
y <- c(0, 0, 0.5, 0, 1, 2, 2, 0, 0, 0, 0, 0 )
x <- c(1, 1.5, 2, 3, 4, 5, 6, 5, 4, 1, 2, 4.5)
d <- c(1,   1, 0, 1, 0, 1, 1, 1, 1, 0, 0,   1)
el.ltrc.EM(y,x,d,mu=3.5)
ypsy <- c(51, 58, 55, 28, 25, 48, 47, 25, 31, 30, 33, 43, 45, 35, 36)
xpsy <- c(52, 59, 57, 50, 57, 59, 61, 61, 62, 67, 68, 69, 69, 65, 76)
dpsy <- c(1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1 )
el.ltrc.EM(ypsy,xpsy,dpsy,mu=64)



