library(mcmc)


### Name: olbm
### Title: Overlapping Batch Means
### Aliases: olbm
### Keywords: ts

### ** Examples

h <- function(x) if (all(x >= 0) && sum(x) <= 1) return(1) else return(-Inf)
out <- metrop(h, rep(0, 5), 1000)
out <- metrop(out, scale = 0.1)
out <- metrop(out, nbatch = 1e4)
foo <- olbm(out$batch, 150)
# monte carlo estimates (true means are same by symmetry)
apply(out$batch, 2, mean)
# monte carlo standard errors (true s. d. are same by symmetry)
sqrt(diag(foo))
# check that batch length is reasonable
acf(out$batch, lag.max = 200)



