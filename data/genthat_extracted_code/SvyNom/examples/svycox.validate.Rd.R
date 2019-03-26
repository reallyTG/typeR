library(SvyNom)


### Name: svycox.validate
### Title: Validating a nomogram for a survey-weighted Cox model
### Aliases: svycox.validate
### Keywords: survival survey nomogram

### ** Examples
bootit=200
library(survey)
library(rms)
data(noNA)
dd=datadist(noNA)
options(datadist="dd")
dstr2=svydesign(id=~1, strata=~group, prob=~inv_weight, fpc=~ssize, data=noNA)
mynom=svycox.nomogram(.design=dstr2, .model=Surv(survival,surv_cens)~ECOG+liver_only+Alb+Hb+Age+
Differentiation+Gt_1_m1site+lymph_only, .data=noNA, pred.at=24, fun.lab="Prob of 2 Yr OS")

cases=which(noNA$group=="long")
controls=which(noNA$group=="<24")
boot.index=matrix(NA,nrow(noNA),bootit)
for(i in 1:bootit){
boot.index[,i]=c(sample(cases,replace=TRUE),sample(controls,replace=TRUE))
}
myval=svycox.validate(boot.index,mynom,noNA)  



