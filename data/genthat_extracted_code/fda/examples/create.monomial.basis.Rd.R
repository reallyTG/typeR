library(fda)


### Name: create.monomial.basis
### Title: Create a Monomial Basis
### Aliases: create.monomial.basis
### Keywords: smooth

### ** Examples

##
## simplest example: one constant 'basis function'
##
m0 <- create.monomial.basis(nbasis=1)
plot(m0)

##
## Create a monomial basis over the interval [-1,1]
##  consisting of the first three powers of t
##
basisobj <- create.monomial.basis(c(-1,1), 5)
#  plot the basis
plot(basisobj)

##
## rangeval of class Date or POSIXct
##
# Date
invasion1 <- as.Date('1775-09-04')
invasion2 <- as.Date('1812-07-12')
earlyUS.Canada <- c(invasion1, invasion2)
BspInvade1 <- create.monomial.basis(earlyUS.Canada)

# POSIXct
AmRev.ct <- as.POSIXct1970(c('1776-07-04', '1789-04-30'))
BspRev1.ct <- create.monomial.basis(AmRev.ct)




