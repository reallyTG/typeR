library(dga)


### Name: remove.close
### Title: A Helper Function to Tell Which Points Are Near the Boundary of
###   a Circle
### Aliases: remove.close
### Keywords: circle

### ** Examples



ps <- cbind(runif(100), runif(100))
inds <- remove.close(ps, .5, .5, .1)




