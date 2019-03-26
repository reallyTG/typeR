library(fda)


### Name: monomialpen
### Title: Evaluate Monomial Roughness Penalty Matrix
### Aliases: monomialpen
### Keywords: smooth

### ** Examples

##
## set up a monomial basis for the first five powers
##
nbasis   <- 5
basisobj <- create.monomial.basis(c(-1,1),nbasis)
#  evaluate the rougness penalty matrix for the
#  second derivative.
penmat <- monomialpen(basisobj, 2)

##
## with rng of class Date and POSIXct
##
# Date
invasion1 <- as.Date('1775-09-04')
invasion2 <- as.Date('1812-07-12')
earlyUS.Canada <- c(invasion1, invasion2)
BspInvade1 <- create.monomial.basis(earlyUS.Canada)
invadmat <- monomialpen(BspInvade1)

# POSIXct
AmRev.ct <- as.POSIXct1970(c('1776-07-04', '1789-04-30'))
BspRev1.ct <- create.monomial.basis(AmRev.ct)
revmat <- monomialpen(BspRev1.ct)




