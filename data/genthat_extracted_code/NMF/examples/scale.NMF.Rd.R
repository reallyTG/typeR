library(NMF)


### Name: scale.NMF
### Title: Rescaling NMF Models
### Aliases: scale.NMF

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# random 3-rank 10x5 NMF model
x <- rnmf(3, 10, 5)

# rescale based on basis
colSums(basis(x))
colSums(basis(scale(x)))

rx <- scale(x, 'basis', 10)
colSums(basis(rx))
rowSums(coef(rx))

# rescale based on coef
rowSums(coef(x))
rowSums(coef(scale(x, 'coef')))
rx <- scale(x, 'coef', 10)
rowSums(coef(rx))
colSums(basis(rx))

# fitted target matrix is identical but the factors have been rescaled
rx <- scale(x, 'basis')
all.equal(fitted(x), fitted(rx))
all.equal(basis(x), basis(rx))



