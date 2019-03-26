library(NMF)


### Name: nmfWrapper
### Title: Wrapping NMF Algorithms
### Aliases: nmfWrapper
### Keywords: internal

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# wrap Lee & Seung algorithm into a function
lee <- nmfWrapper('lee', seed=12345)
args(lee)

# test on random data
x <- rmatrix(100,20)
res <- nmf(x, 3, 'lee', seed=12345)
res2 <- lee(x, 3)
nmf.equal(res, res2)
res3 <- lee(x, 3, seed=123)
nmf.equal(res, res3)

## Don't show: 
stopifnot(nmf.equal(res, res2))
stopifnot( !nmf.equal(res, res3))
## End(Don't show)

# argument 'method' has no effect
res4 <- lee(x, 3, method='brunet')
nmf.equal(res, res4)

## Don't show: 
stopifnot(nmf.equal(res, res4))
## End(Don't show)



