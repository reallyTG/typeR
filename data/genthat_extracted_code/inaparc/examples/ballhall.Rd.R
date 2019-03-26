library(inaparc)


### Name: ballhall
### Title: Initialization of cluster prototypes using Ball & Hall's
###   algorithm
### Aliases: ballhall
### Keywords: cluster

### ** Examples

data(iris)
# Run with a user described threshold value
v1 <- ballhall(x=iris[,1:4], k=5, tv=0.6)$v
print(v1)

# Run with the internally computed default threshold value
v2 <- ballhall(x=iris[,1:4], k=5)$v
print(v2)



