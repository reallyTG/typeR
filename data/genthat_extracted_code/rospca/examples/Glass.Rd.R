library(rospca)


### Name: Glass
### Title: Glass data
### Aliases: Glass
### Keywords: datasets

### ** Examples

data(Glass)

res <- robpca(Glass, k=4, alpha=0.5)
matplot(res$loadings, type="l", lty=1)



