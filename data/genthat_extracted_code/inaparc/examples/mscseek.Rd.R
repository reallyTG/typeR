library(inaparc)


### Name: mscseek
### Title: Initialization of cluster prototypes using the modified SCS
###   algorithm
### Aliases: mscseek
### Keywords: cluster

### ** Examples

data(iris)
# Run with the threshold value of 0.1
res <- mscseek(x=iris[,1:4], k=5, tv=0.1)
v1 <- res$v
print(v1)

# Run with the internally computed default threshold value 
res <- mscseek(x=iris[,1:4], k=5)
v2 <- res$v
print(v2)



