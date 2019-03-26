library(maxLik)


### Name: fnSubset
### Title: Call fnFull with variable and fixed parameters
### Aliases: fnSubset
### Keywords: optimize utilities

### ** Examples

##
## Example with 'optim'
##
fn <- function(x) (x[2]-2*x[1])^2
# note: true minimum is 0 on line 2*x[1] == x[2]
fullEst <- optim(par=c(1,1), method="BFGS", fn=fn)
fullEst$par
# par = c(0.6, 1.2) at minimum (not convex)

# Fix the last component to 4 
est4 <- optim(par=1, fn=fnSubset, method="BFGS", fnFull=fn, xFixed=4)
est4$par
# now there is a unique minimun x[1] = 2

# Fix the first component
fnSubset(x=1, fnFull=fn, xFixed=c(a=4), xFull=c(a=1, b=2))
# After substitution:  xFull = c(a=4, b=1),
# so fn = (1 - 2*4)^2 = (-7)^2 = 49

est4. <- optim(par=1, fn=fnSubset, method="BFGS",
               fnFull=fn, xFixed=c(a=4), 
               xFull=c(a=1, b=2))
est4.$par
# At optimum: xFull=c(a=4, b=8),
# so fn = (8 - 2*4)^2 = 0

##
## Example with 'maxLik'
##
fn2max <- function(x) -(x[2]-2*x[1])^2
# -> need to have a maximum
max4 <- maxLik(fnSubset, start=1, fnFull=fn2max, xFixed=4)
summary(max4)
# Similar result using fixed parameters in maxNR, called by maxLik 
max4. <- maxLik(fn2max, start=c(1, 4), fixed=2)
summary(max4.)



