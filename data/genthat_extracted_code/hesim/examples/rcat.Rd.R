library(hesim)


### Name: rcat
### Title: Random generation for categorical distribution
### Aliases: rcat

### ** Examples

p <- c(.2, .5, .3)
n <- 10000
pmat <- matrix(rep(p, n), nrow = n, ncol = length(p), byrow = TRUE)

# rcat
set.seed(100)
ptm <- proc.time()
samp1 <- rcat(n, pmat)
proc.time() - ptm
prop.table(table(samp1))

# rmultinom from base R 
set.seed(100)
ptm <- proc.time()
samp2 <- t(apply(pmat, 1, rmultinom, n = 1, size = 1))
samp2 <- apply(samp2, 1, function(x) which(x == 1))
proc.time() - ptm
prop.table(table(samp2))



