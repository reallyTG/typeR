library(MXM)


### Name: Bayesian Network construction using a hybrid of MMPC and PC
### Title: Bayesian Network construction using a hybrid of MMPC and PC
### Aliases: mmpc.or
### Keywords: MMHC algorithm

### ** Examples

y <- rdag2(1000, p = 20, nei = 3)
ind <- sample(1:20, 20)
x <- y$x[, ind]
a1 <- mmpc.or(x, max_k = 3, threshold = 0.01, test = "testIndFisher" ) 
b <- pc.skel( x, method = "comb.fast", alpha = 0.01 ) 
a2 <- pc.or(b)



