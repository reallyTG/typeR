library(akmeans)


### Name: akmeans
### Title: Adaptive K-means algorithm with threshold setting
### Aliases: akmeans
### Keywords: adaptive kmeans

### ** Examples

x = matrix(rnorm(1000),100,10)
akmeans(x) ## euclidean distance based

akmeans(x,d.metric=2,ths3=0.8,mode=3) ## cosine distance based



