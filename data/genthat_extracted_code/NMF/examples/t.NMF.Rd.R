library(NMF)


### Name: t.NMF
### Title: Transformation NMF Model Objects
### Aliases: t.NMF

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

x <- rnmf(3, 100, 20)
x
# transpose
y <- t(x)
y

# factors are swapped-transposed
stopifnot( identical(basis(y), t(coef(x))) )
stopifnot( identical(coef(y), t(basis(x))) )



