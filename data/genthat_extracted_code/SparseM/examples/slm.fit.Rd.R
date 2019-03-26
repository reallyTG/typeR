library(SparseM)


### Name: slm.fit
### Title: Internal slm fitting functions
### Aliases: slm.fit slm.fit slm.wfit slm.fit.csr
### Keywords: regression

### ** Examples

data(lsq)
X <- model.matrix(lsq) #extract the design matrix
y <- model.response(lsq) # extract the rhs
class(X) # -> "matrix.csr"
class(y) # -> NULL
slm.fit(X,y)->slm.fit.o # this is much more efficient in memory usage than slm()
slm(y~as.matrix(X)-1) -> slm.o # this requires X to be transformed into dense mode
cat("Difference between `slm.fit' and `slm' estimated coefficients =",
	sum(abs(slm.fit.o$coef-slm.o$coef)),"\n")



