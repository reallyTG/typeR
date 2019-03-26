library(yaImpute)


### Name: applyMask
### Title: Removes neighbors that share (or not) group membership with
###   targets.
### Aliases: applyMask
### Keywords: multivariate

### ** Examples


require (yaImpute)

data(iris)

# build a base case, there are no targets, 
#    turn off getting references neighbors.
mal <- yai(x=iris[,-5],method="mahalanobis", noRefs = TRUE)

# create a new data, just a copy of the old with new row names.
iris2 <- iris
rownames(iris2) <- paste0("new.",rownames(iris))

# do an imputation with k=55
m55 <- newtargets(mal,newdata=iris2,k=55)

# get the 2 closest where the species codes don't match by
#  removing neighbors when the ref group membership is 
#  in common with the target group membership (same species),
#  thereby forcing neighbors to be from different species. 

#  in this case, the groups are species codes. 

applyMask(m55,refGroups=iris$Species,trgGroups=iris2$Species,
          method="removeWhenCommon",k=2)

# get the 2 closest where the species codes do match by
#  removing neighbors when the ref group membership is 
#  different than the target group membership (different species),
#  thereby forcing neighbors to be from the same species (this
#  is generally true anyway using the iris data). 

applyMask(m55,iris$Species,trgGroups=iris2$Species,
          method="keepWhenCommon",k=2)




