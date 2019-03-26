library(refund)


### Name: fpcr
### Title: Functional principal component regression
### Aliases: fpcr

### ** Examples


require(fda)
### 1D functional predictor example ###

######### Octane data example #########
data(gasoline)

# Create the requisite functional data objects
bbasis = create.bspline.basis(c(900, 1700), 40)
wavelengths = 2*450:850
nir <- t(gasoline$NIR)
gas.fd = smooth.basisPar(wavelengths, nir, bbasis)$fd

# Method 1: Call fpcr with fdobj argument
gasmod1 = fpcr(gasoline$octane, fdobj = gas.fd, ncomp = 30)
plot(gasmod1, xlab="Wavelength")
## Not run: 
##D # Method 2: Call fpcr with explicit signal matrix
##D gasmod2 = fpcr(gasoline$octane, xfuncs = gasoline$NIR, ncomp = 30)
##D # Method 3: Call fpcr with explicit signal, basis, and penalty matrices
##D gasmod3 = fpcr(gasoline$octane, xfuncs = gasoline$NIR,
##D                basismat = eval.basis(wavelengths, bbasis),
##D                penmat = getbasispenalty(bbasis), ncomp = 30)
##D 
##D # Check that all 3 calls yield essentially identical estimates
##D all.equal(gasmod1$fhat, gasmod2$fhat, gasmod3$fhat)
##D # But note that, in general, you'd have to specify argvals in Method 1
##D # to get the same coefficient function values as with Methods 2 & 3.
## End(Not run)

### 2D functional predictor example ###

n = 200; d = 70

# Create true coefficient function
ftrue = matrix(0,d,d)
ftrue[40:46,34:38] = 1

# Generate random functional predictors, and scalar responses
ii = array(rnorm(n*d^2), dim=c(n,d,d))
iimat = ii; dim(iimat) = c(n,d^2)
yy = iimat %*% as.vector(ftrue) + rnorm(n, sd=.3)

mm = fpcr(yy, ii, ncomp=40)

image(ftrue)
contour(mm$fhat, add=TRUE)

## Not run: 
##D ### Cross-validation ###
##D cv.gas = fpcr(gasoline$octane, xfuncs = gasoline$NIR,
##D                  nbasis=seq(20,40,5), ncomp = seq(10,20,5), store.cv = TRUE)
##D image(seq(20,40,5), seq(10,20,5), cv.gas$cv.table, xlab="Basis size",
##D       ylab="Number of PCs", xaxp=c(20,40,4), yaxp=c(10,20,2))
##D 
## End(Not run)



