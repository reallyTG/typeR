library(NMF)


### Name: basisnames
### Title: Dimension names for NMF objects
### Aliases: basisnames basisnames<- basisnames<-,ANY-method
###   basisnames,ANY-method basisnames<--methods basisnames-methods
###   dimnames-NMF dimnames<-,NMF-method dimnames,NMF-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# create a random NMF object
a <- rnmf(2, 5, 3)

# set dimensions
dims <- list( features=paste('f', 1:nrow(a), sep='')
				, samples=paste('s', 1:ncol(a), sep='')
				, basis=paste('b', 1:nbasis(a), sep='') )
dimnames(a) <- dims
dimnames(a)
basis(a)
coef(a)

# access the dimensions separately
rownames(a)
colnames(a)
basisnames(a)

# set only the first dimension (rows of basis): the other two dimnames are set to NULL
dimnames(a) <- dims[1]
dimnames(a)
basis(a)
coef(a)

# set only the two first dimensions (rows and columns of basis and coef respectively):
# the basisnames are set to NULL
dimnames(a) <- dims[1:2]
dimnames(a)
basis(a)

# reset the dimensions
dimnames(a) <- NULL
dimnames(a)
basis(a)
coef(a)

# set each dimensions separately
rownames(a) <- paste('X', 1:nrow(a), sep='') # only affect rows of basis
basis(a)

colnames(a) <- paste('Y', 1:ncol(a), sep='') # only affect columns of coef
coef(a)

basisnames(a) <- paste('Z', 1:nbasis(a), sep='') # affect both basis and coef matrices
basis(a)
coef(a)



