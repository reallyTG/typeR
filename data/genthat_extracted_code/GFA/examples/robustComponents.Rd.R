library(GFA)


### Name: robustComponents
### Title: Robust GFA components
### Aliases: robustComponents

### ** Examples

X <- matrix(rnorm(10*2),10,2)
W <- matrix(rnorm(15*2),15,2)
Y <- tcrossprod(X,W) + matrix(rnorm(10*15),10,15)
opts <- getDefaultOpts() #Default options
#Fast runs for the demo, default options recommended in general
opts[c("iter.burnin", "iter.max")] <- c(500, 1000)
res <- list()
for(i in 1:4) res[[i]] <- gfa(list(Y[,1:6],Y[,7:15]),opts=opts,K=3)
rob <- robustComponents(res)



