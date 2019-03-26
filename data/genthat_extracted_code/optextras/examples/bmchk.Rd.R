library(optextras)


### Name: bmchk
### Title: Check bounds and masks for parameter constraints used in
###   nonlinear optimization
### Aliases: bmchk
### Keywords: nonlinear optimize upper lower bound mask

### ** Examples

#####################

cat("25-dimensional box constrained function\n")
flb <- function(x)
    { p <- length(x); sum(c(1, rep(4, p-1)) * (x - c(1, x[-p])^2)^2) }

start<-rep(2, 25)
cat("\n start:")
print(start)
lo<-rep(2,25)
cat("\n lo:")
print(lo)
hi<-rep(4,25)
cat("\n hi:")
print(hi)
bt<-bmchk(start, lower=lo, upper=hi, trace=1)
print(bt)




