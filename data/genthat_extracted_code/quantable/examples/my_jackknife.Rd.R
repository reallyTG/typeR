library(quantable)


### Name: my_jackknife
### Title: copute jack knive
### Aliases: my_jackknife

### ** Examples

xx <- matrix(rnorm(20), ncol=4) 
cortest <- function(x){print(dim(x));cor(x)}
my_jackknife(xx, cortest)
my_jackknife(xx, cor, use="pairwise.complete.obs", method="pearson")



