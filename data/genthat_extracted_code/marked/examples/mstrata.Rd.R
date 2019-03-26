library(marked)


### Name: mstrata
### Title: Multistrata example data
### Aliases: mstrata
### Keywords: datasets

### ** Examples

## No test: 
data(mstrata)
ms1=process.data(mstrata,model="MSCJS",strata.labels=c("A","B","C"))
ms2=process.data(mstrata,model="hmmMSCJS",strata.labels=c("A","B","C"))
# strata.labels for MVMS models must be specified as a list because more than one variable
# can be used
ms3=process.data(mstrata,model="MVMSCJS",strata.labels=list(state=c("A","B","C")))
ms1.ddl=make.design.data(ms1)
ms2.ddl=make.design.data(ms2)
ms3.ddl=make.design.data(ms3)

# following requires ADMB or the exe constructed from ADMB and links set for ADMB
mod1=try(crm(ms1,ms1.ddl,model.parameters=list(Psi=list(formula=~-1+stratum:tostratum),
      p=list(formula=~time)),hessian=TRUE))
if(class(mod1)[1]!="try-error") mod1

mod2=crm(ms2,ms2.ddl,model.parameters=list(Psi=list(formula=~-1+stratum:tostratum),
      p=list(formula=~time)),hessian=TRUE)
mod2

mod3=crm(ms3,ms3.ddl,model.parameters=list(Psi=list(formula=~-1+stratum:tostratum),
      p=list(formula=~time)),hessian=TRUE)
mod3
## End(No test)



