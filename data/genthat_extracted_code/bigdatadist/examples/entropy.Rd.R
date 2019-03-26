library(bigdatadist)


### Name: entropy
### Title: Entropy Computation
### Aliases: entropy
### Keywords: Entropy

### ** Examples

require(MASS);
data = mvrnorm(100,c(0,0),diag(2));
entropy(data, alpha = 2, k.neighbor = 10, scale = FALSE)



