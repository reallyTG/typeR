library(selectiveInference)


### Name: manyMeans
### Title: Selective inference for many normal means
### Aliases: manyMeans

### ** Examples

set.seed(12345)
n = 100 
mu = c(rep(3,floor(n/5)), rep(0,n-floor(n/5))) 
y = mu + rnorm(n)
out = manyMeans(y, bh.q=0.1)
out



