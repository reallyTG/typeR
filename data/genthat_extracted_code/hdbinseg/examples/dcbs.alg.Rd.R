library(hdbinseg)


### Name: dcbs.alg
### Title: Double CUSUM Binary Segmentation
### Aliases: dcbs.alg

### ** Examples

x <- matrix(rnorm(10*100), nrow=10)
dcbs.alg(x, cp.type=1, phi=.5, temporal=FALSE, do.parallel=0)$ecp
## No test: 
x <- matrix(rnorm(100*300), nrow=100)
x[1:10, 151:300] <- x[1:10, 151:300] + 1
dcbs.alg(x, cp.type=1, phi=-1, temporal=FALSE, do.parallel=0)$ecp
## End(No test)



