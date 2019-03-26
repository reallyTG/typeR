library(NMF)


### Name: basis
### Title: Accessing NMF Factors
### Aliases: basis .basis .basis<- basis<- basis,ANY-method
###   .basis<--methods .basis-methods basis<--methods basis-methods
###   .basis<-,NMFfit,matrix-method .basis,NMFfit-method
###   basis,NMFfitXn-method .basis<-,NMF,matrix-method .basis,NMF-method
###   basis<-,NMF-method basis,NMF-method .basis<-,NMFstd,matrix-method
###   .basis,NMFstd-method coef .coef .coef<- coef<- coefficients
###   coefficients-methods coefficients,NMF-method .coef<--methods
###   .coef-methods coef<--methods coef-methods
###   .coef<-,NMFfit,matrix-method .coef,NMFfit-method coef,NMFfitXn-method
###   .coef<-,NMF,matrix-method .coef,NMF-method coef<-,NMF-method
###   coef,NMF-method .coef<-,NMFstd,matrix-method .coef,NMFstd-method
###   loadings,NMF-method scoef scoef,matrix-method scoef-methods
###   scoef,NMF-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# scoef
#----------
# Scaled coefficient matrix
x <- rnmf(3, 10, 5)
scoef(x)
scoef(x, 100)

#----------
# .basis,NMFstd-method
#----------
# random standard NMF model
x <- rnmf(3, 10, 5)
basis(x)
coef(x)

# set matrix factors
basis(x) <- matrix(1, nrow(x), nbasis(x))
coef(x) <- matrix(1, nbasis(x), ncol(x))
# set random factors
basis(x) <- rmatrix(basis(x))
coef(x) <- rmatrix(coef(x))

# incompatible matrices generate an error:
try( coef(x) <- matrix(1, nbasis(x)-1, nrow(x)) )
# but the low-level method allow it
.coef(x) <- matrix(1, nbasis(x)-1, nrow(x))
try( validObject(x) )



