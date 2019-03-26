library(jstable)


### Name: svycox.display
### Title: svycoxph.display: table for svycoxph.object in survey package.
### Aliases: svycox.display

### ** Examples

 library(survival);data(pbc)
 pbc$sex = factor(pbc$sex)
 pbc$stage = factor(pbc$stage)
 pbc$randomized<-with(pbc, !is.na(trt) & trt>0)
 biasmodel<-glm(randomized~age*edema,data=pbc,family=binomial)
 pbc$randprob<-fitted(biasmodel)
 
 if (is.null(pbc$albumin)) pbc$albumin<-pbc$alb ##pre2.9.0
 
 dpbc <- survey::svydesign(id=~1, prob=~randprob, strata=~edema, data=subset(pbc,randomized))
 
 model <- survey::svycoxph(Surv(time,status>0)~ sex + protime + albumin + stage,design=dpbc)
 svycox.display(model)



