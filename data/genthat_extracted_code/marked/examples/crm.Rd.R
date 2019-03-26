library(marked)


### Name: crm
### Title: Capture-recapture model fitting function
### Aliases: crm
### Keywords: models

### ** Examples

{
# cormack-jolly-seber model
# fit 3 cjs models with crm
data(dipper)
dipper.proc=process.data(dipper,model="cjs",begin.time=1)
dipper.ddl=make.design.data(dipper.proc)
mod.Phit.pt=crm(dipper.proc,dipper.ddl,
   model.parameters=list(Phi=list(formula=~time),p=list(formula=~time)))
mod.Phit.pt
mod.Phisex.pdot=crm(dipper.proc,dipper.ddl,groups="sex",
   model.parameters=list(Phi=list(formula=~sex),p=list(formula=~1)))
mod.Phisex.pdot
## if you have RMark installed you can use this code to run the same models 
## by removing the comment symbol
#library(RMark)
#data(dipper)
#mod0=mark(dipper,
#model.parameters=list(Phi=list(formula=~time),p=list(formula=~time)),output=FALSE)
#summary(mod0,brief=TRUE)
#mod1=mark(dipper,
#model.parameters=list(Phi=list(formula=~1),p=list(formula=~1)),output=FALSE)
#summary(mod1,brief=TRUE)
#mod2<-mark(dipper,groups="sex",
#model.parameters=list(Phi=list(formula=~sex),p=list(formula=~1)),output=FALSE)
#summary(mod2,brief=TRUE)
# jolly seber model
crm(dipper,model="js",groups="sex",
   model.parameters=list(pent=list(formula=~sex),N=list(formula=~sex)),accumulate=FALSE)
## No test: 
# This example is excluded from testing to reduce package check time
# if you have RMark installed you can use this code to run the same models 
# by removing the comment 
#data(dipper)
#data(mstrata)
#mark(dipper,model.parameters=list(p=list(formula=~time)),output=FALSE)$results$beta
#mark(mstrata,model="Multistrata",model.parameters=list(p=list(formula=~1),
# S=list(formula=~1),Psi=list(formula=~-1+stratum:tostratum)),
# output=FALSE)$results$beta
#mod=mark(dipper,model="POPAN",groups="sex",
#   model.parameters=list(pent=list(formula=~sex),N=list(formula=~sex)))
#summary(mod)
#CJS example with hmm
crm(dipper,model="hmmCJS",model.parameters = list(p = list(formula = ~time)))
##MSCJS example with hmm
data(mstrata)
ms=process.data(mstrata,model="hmmMSCJS",strata.labels=c("A","B","C"))
ms.ddl=make.design.data(ms)
ms.ddl$Psi$fix=NA
ms.ddl$Psi$fix[ms.ddl$Psi$stratum==ms.ddl$Psi$tostratum]=1
crm(ms,ms.ddl,model.parameters=list(Psi=list(formula=~-1+stratum:tostratum)))
## End(No test)
}



