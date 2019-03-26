library(survey)


### Name: confint.svyglm
### Title: Confidence intervals for regression parameters
### Aliases: confint.svyglm
### Keywords: survey

### ** Examples

data(api)
dclus2<-svydesign(id=~dnum+snum, fpc=~fpc1+fpc2, data=apiclus2)

m<-svyglm(I(comp.imp=="Yes")~stype*emer+ell, design=dclus2, family=quasibinomial)
confint(m)
confint(m, method="like",ddf=NULL, parm=c("ell","emer"))




