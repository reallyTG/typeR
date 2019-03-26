library(corHMM)


### Name: ancRECON
### Title: Ancestral state reconstruction
### Aliases: ancRECON
### Keywords: reconstructions

### ** Examples

# Not run
## Load tree and trait
# data(primates)
## Obtain the marginal reconstruction for a set of parameters:
# param<-c(0.05,10,0.01,0.01,0.06,0,0.02,51.2)
# states<-ancRECON(primates$tree,primates$trait,p=param,method="marginal",
# hrm=FALSE,ntraits=2,model="ARD")
## Put likeliest states on the tree:
# pr<-apply(states$lik.anc.states,1,which.max)
# primates$tree$node.label <- pr



