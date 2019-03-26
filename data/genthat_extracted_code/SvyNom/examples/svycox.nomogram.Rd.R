library(SvyNom)


### Name: svycox.nomogram
### Title: Builds a nomogram for a survey-weighted Cox model
### Aliases: svycox.nomogram
### Keywords: survival survey nomogram

### ** Examples

library(survey)
library(rms)
data(noNA)
dd=datadist(noNA)
options(datadist="dd")
dstr2=svydesign(id=~1, strata=~group, prob=~inv_weight, fpc=~ssize, data=noNA)
mynom=svycox.nomogram(.design=dstr2, .model=Surv(survival,surv_cens)~ECOG+liver_only+Alb+Hb+Age+
Differentiation+Gt_1_m1site+lymph_only, .data=noNA, pred.at=24, fun.lab="Prob of 2 Yr OS")
plot(mynom$nomog)



