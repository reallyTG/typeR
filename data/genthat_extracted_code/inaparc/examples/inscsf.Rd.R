library(inaparc)


### Name: inscsf
### Title: Initialization cluster prototypes using Inscsf algorithm
### Aliases: inscsf
### Keywords: cluster

### ** Examples

data(iris)
# Use the 4th feature as the selected feature
v1 <- inscsf(x=iris[,1:4], k=5, sfidx=4)$v
print(v1)

# Use the internally selected feature
v2 <- inscsf(x=iris[,1:4], k=5)$v
print(v2)



