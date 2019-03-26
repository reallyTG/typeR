library(dga)


### Name: remove.close.ellipse
### Title: A Helper Function to Tell Which Points are Near the Boundary of
###   the Ellipse
### Aliases: remove.close.ellipse
### Keywords: ellipse

### ** Examples


## The function is currently defined as
ps <- cbind(runif(100), runif(100))
inds <- remove.close.ellipse(ps, .5, .5, .1, .3, 1)




