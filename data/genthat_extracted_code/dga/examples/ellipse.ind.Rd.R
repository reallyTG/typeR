library(dga)


### Name: ellipse.ind
### Title: A Helper Function Used by Venn4
### Aliases: ellipse.ind
### Keywords: ellipse

### ** Examples



## The function is currently defined as
ps <- cbind(runif(100), runif(100))
plot(ellipse(0,0,.5, .3, 0), type = 'l')
inds <- ellipse.ind(ps, 0, 0, .5, .3, 0)
points(inds)



