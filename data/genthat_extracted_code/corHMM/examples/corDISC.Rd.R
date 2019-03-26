library(corHMM)


### Name: corDISC
### Title: Correlated evolution binary traits
### Aliases: corDISC
### Keywords: models

### ** Examples

## Not run
## Load tree and data
# data(primates)

## Obtain the fit for two binary characters
# pp<-corDISC(primates$tree,primates$trait,ntraits=2,model="ARD",
# node.states="marginal", diagn=FALSE)
# pp

## State combination three is not an observed state, so for fun, let's remove
## these transitions:
# new.mat <- rate.mat.maker(hrm=FALSE, ntraits=2, model="ARD")
# new.mat <- rate.par.drop(new.mat, c(2,8,5,6))
# pp<-corDISC(primates$tree,primates$trait,ntraits=2,rate.mat=new.mat,model="ARD",
# node.states="marginal", diagn=FALSE)
# pp



