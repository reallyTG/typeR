library(NMF)


### Name: [,NMF-method
### Title: Sub-setting NMF Objects
### Aliases: [,NMF-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# create a dummy NMF object that highlight the different way of subsetting
a <- nmfModel(W=outer(seq(1,5),10^(0:2)), H=outer(10^(0:2),seq(-1,-10)))
basisnames(a) <- paste('b', 1:nbasis(a), sep='')
rownames(a) <- paste('f', 1:nrow(a), sep='')
colnames(a) <- paste('s', 1:ncol(a), sep='')

# or alternatively:
# dimnames(a) <- list( features=paste('f', 1:nrow(a), sep='')
#					, samples=paste('s', 1:ncol(a), sep='')
#					, basis=paste('b', 1:nbasis(a)) )

# look at the resulting NMF object
a
basis(a)
coef(a)

# extract basis components
a[1]
a[1, drop=FALSE] # not dropping matrix dimension
a[2:3]

# subset on the features
a[1,]
a[2:4,]
# dropping the NMF-class wrapping => return subset basis matrix
a[2:4,, drop=TRUE]

# subset on the samples
a[,1]
a[,2:4]
# dropping the NMF-class wrapping => return subset coef matrix
a[,2:4, drop=TRUE]

# subset on the basis => subsets simultaneously basis and coef matrix
a[,,1]
a[,,2:3]
a[4:5,,2:3]
a[4:5,,2:3, drop=TRUE] # return subset basis matrix
a[,4:5,2:3, drop=TRUE] # return subset coef matrix

# 'drop' has no effect here
a[,,2:3, drop=TRUE]



