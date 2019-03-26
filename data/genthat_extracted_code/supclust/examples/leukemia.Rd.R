library(supclust)


### Name: leukemia
### Title: A part of the Golub's famous AML/ALL-leukemia dataset
### Aliases: leukemia leukemia.x leukemia.y leukemia.z
### Keywords: datasets

### ** Examples

data(leukemia, package="supclust")
str(leukemia.x)
str(leukemia.y)
str(leukemia.z)
op <- par(mfrow= 1:2)
plot(leukemia.x[,56], leukemia.y)
plot(leukemia.x[,174],leukemia.z)
par(op)



