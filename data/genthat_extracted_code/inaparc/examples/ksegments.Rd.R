library(inaparc)


### Name: ksegments
### Title: Initialization of cluster prototypes using the centers of k
###   segments
### Aliases: ksegments
### Keywords: cluster

### ** Examples

data(iris)

# Generate the prototypes matrix using the means of segments
res <- ksegments(x=iris[,1:4], k=5, ctype="avg")
v <- res$v
print(v)



