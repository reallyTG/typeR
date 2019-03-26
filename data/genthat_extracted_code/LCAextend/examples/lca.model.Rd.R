library(LCAextend)


### Name: lca.model
### Title: fits latent class models for phenotypic measurements in
###   pedigrees with or without familial dependence using an
###   Expectation-Maximization (EM) algorithm
### Aliases: lca.model

### ** Examples

#data
data(ped.ordi)
fam <- ped.ordi[,1]
#probs and param
data(param.ordi)
data(probs)
#the function applied only to two first families of ped.ordi
lca.model(ped.ordi[fam%in%1:2,],probs,param.ordi,optim.noconst.ordi,
          fit=TRUE,optim.probs.indic=c(TRUE,TRUE,TRUE,TRUE),tol=0.001,x=NULL,
          var.list=NULL,famdep=TRUE,modify.init=NULL)



