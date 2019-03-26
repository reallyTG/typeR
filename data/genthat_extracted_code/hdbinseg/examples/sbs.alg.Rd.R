library(hdbinseg)


### Name: sbs.alg
### Title: Sparsified Binary Segmentation
### Aliases: sbs.alg

### ** Examples

x <- matrix(rnorm(20*300), nrow=20)
sbs.alg(x, cp.type=2, scales=-1, diag=TRUE, do.parallel=0)$ecp
## No test: 
x <- matrix(rnorm(100*300), nrow=100)
x[1:10, 151:300] <- x[1:10, 151:300]*sqrt(2)
sbs.alg(x, cp.type=2, scales=-1, diag=TRUE, do.parallel=0)$ecp
## End(No test)



