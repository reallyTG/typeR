library(Ecfun)


### Name: sign
### Title: Sign function with zero option
### Aliases: sign
### Keywords: manip

### ** Examples

##
## 1.  default
##
sx <- sign((-2):2)

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(sx, base::sign((-2):2))
## Don't show: 
)
## End(Don't show)

##
## 2.  with zero = 1
##
s1 <- sign((-2):2, 1)

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(s1, rep(c(-1, 1), c(2,3)))
## Don't show: 
)
## End(Don't show)



