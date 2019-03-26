library(inaparc)


### Name: scseek
### Title: Initialization of cluster prototypes using SCS algorithm
### Aliases: scseek
### Keywords: cluster

### ** Examples

data(iris)
# Run with the threshold value of 0.5
res <- scseek(x=iris[,1:4], k=5, tv=0.5)
v1 <- res$v
print(v1)

# Run with the internally computed default threshold value 
res <- scseek(x=iris[,1:4], k=5)
v2 <- res$v
print(v2)



