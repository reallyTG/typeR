library(inaparc)


### Name: uniquek
### Title: Initialization of cluster prototypes over the unique values
### Aliases: uniquek
### Keywords: cluster

### ** Examples

data(iris)
# Run with the internally selected feature
res <- uniquek(x=iris[,1:4], k=5)
v <- res$v
print(v)

# Run with the 1st feature
res <- uniquek(x=iris[,1:4], k=5, sfidx=1)
v <- res$v
print(v)



