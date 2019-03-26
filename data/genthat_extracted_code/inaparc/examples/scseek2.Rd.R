library(inaparc)


### Name: scseek2
### Title: Initialization of cluster prototypes using SCS algorithm over a
###   selected feature
### Aliases: scseek2
### Keywords: cluster

### ** Examples

data(iris)
# Run over 4th feature with the threshold value of 0.5
res <- scseek2(x=iris[,1:4], k=5, sfidx=4, tv=0.5)
v1 <- res$v
print(v1)

# Run with the internally computed default threshold value 
res <- scseek2(x=iris[,1:4], k=5)
v2 <- res$v
print(v2)




