library(dga)


### Name: circle.ind
### Title: A Helper Function for venn3
### Aliases: circle.ind
### Keywords: circle

### ** Examples



ps <- cbind(runif(100), runif(100))
plot(circle(0,0,1), type = 'l')
inds <- circle.ind(ps, 0, 0, 1)
points(inds)



