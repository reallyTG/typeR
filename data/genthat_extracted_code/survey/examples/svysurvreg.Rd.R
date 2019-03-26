library(survey)


### Name: svysurvreg
### Title: Fit accelerated failure models to survey data
### Aliases: svysurvreg svysurvreg.survey.design
### Keywords: survey survival

### ** Examples


 data(pbc, package="survival")
 pbc$randomized <- with(pbc, !is.na(trt) & trt>0)
 biasmodel<-glm(randomized~age*edema,data=pbc)
 pbc$randprob<-fitted(biasmodel)
 dpbc<-svydesign(id=~1, prob=~randprob, strata=~edema,
    data=subset(pbc,randomized))

 model <- svysurvreg(Surv(time, status>0)~bili+protime+albumin, design=dpbc, dist="weibull")
summary(model)




