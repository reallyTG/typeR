library(ergm)


### Name: standardize.network
### Title: Copy a network object enforcing ergm-appropriate guarantees
###   about its internal representation
### Aliases: standardize.network
### Keywords: internal

### ** Examples


test<-network.initialize(5,directed=FALSE)
test[2,1]<-1  #ergm wont like this
test$mel[[1]] # peek at internal representation

test2<-standardize.network(test) # enforce!
test2$mel[[2]]  # 1 and 2 have traded places





