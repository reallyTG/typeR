library(jskm)


### Name: svyjskm
### Title: Creates a Weighted Kaplan-Meier plot - svykm.object in survey
###   package
### Aliases: svyjskm

### ** Examples

 library(survey)
 data(pbc, package="survival")
 pbc$randomized <- with(pbc, !is.na(trt) & trt>0)
 biasmodel <- glm(randomized~age*edema,data=pbc)
 pbc$randprob <- fitted(biasmodel)
 dpbc <- svydesign(id=~1, prob=~randprob, strata=~edema, data=subset(pbc,randomized))
 s1 <- svykm(Surv(time,status>0)~sex, design=dpbc)
 svyjskm(s1)



