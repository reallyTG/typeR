library(LCAextend)


### Name: model.select
### Title: selects a latent class model for pedigree data
### Aliases: model.select

### ** Examples

#data
data(ped.cont)
fam <- ped.cont[,1]
#the function applied for the two first families of ped.cont
model.select(ped.cont[fam%in%1:2,],distribution="normal",trans.const=TRUE,
             optim.indep.norm,optim.probs.indic=c(TRUE,TRUE,TRUE,TRUE),
             famdep=TRUE,selec="bic",K.vec=1:3,tol=0.001,x=NULL,var.list=NULL)



