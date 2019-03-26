library(treespace)


### Name: wiwTreeDist
### Title: Transmission tree distance
### Aliases: wiwTreeDist

### ** Examples

# create some simple "who infected whom" scenarios:
tree1 <- cbind(Infector=1:5,Infectee=2:6) 
tree2 <- cbind(Infector=c(1,5,2,2,3),Infectee=2:6)
tree3 <- cbind(Infector=c(2,2,3,4,5),Infectee=c(1,3,4,5,6)) 
# create list of the MRCI depth matrices:
matList <- lapply(list(tree1,tree2,tree3), function(x) findMRCIs(x)$mrciDepths)

# transmission tree distance, assuming all cases are sampled:
wiwTreeDist(matList)
# transmission tree distance when cases 1, 2 and 4 are sampled:
wiwTreeDist(matList, sampled=c(1,2,4))




