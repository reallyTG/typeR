library(survey)


### Name: psrsq
### Title: Pseudo-Rsquareds
### Aliases: psrsq
### Keywords: survey regression

### ** Examples

data(api)
dclus2<-svydesign(id=~dnum+snum, weights=~pw, data=apiclus2)

model1<-svyglm(I(sch.wide=="Yes")~ell+meals+mobility+as.numeric(stype), 
     design=dclus2, family=quasibinomial())

psrsq(model1, type="Nagelkerke")




