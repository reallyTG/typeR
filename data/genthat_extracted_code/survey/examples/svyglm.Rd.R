library(survey)


### Name: svyglm
### Title: Survey-weighted generalised linear models.
### Aliases: svyglm svyglm.survey.design svyglm.svyrep.design
###   summary.svyglm summary.svrepglm vcov.svyglm residuals.svyglm
###   residuals.svrepglm predict.svyglm predict.svrepglm coef.svyglm
### Keywords: regression survey

### ** Examples


  data(api)


  dstrat<-svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
  dclus2<-svydesign(id=~dnum+snum, weights=~pw, data=apiclus2)
  rstrat<-as.svrepdesign(dstrat)
  rclus2<-as.svrepdesign(dclus2)

  summary(svyglm(api00~ell+meals+mobility, design=dstrat))
  summary(svyglm(api00~ell+meals+mobility, design=dclus2))
  summary(svyglm(api00~ell+meals+mobility, design=rstrat))
  summary(svyglm(api00~ell+meals+mobility, design=rclus2))

  ## use quasibinomial, quasipoisson to avoid warning messages
  summary(svyglm(sch.wide~ell+meals+mobility, design=dstrat,
        family=quasibinomial()))


  ## Compare regression and ratio estimation of totals
  api.ratio <- svyratio(~api.stu,~enroll, design=dstrat)
  pop<-data.frame(enroll=sum(apipop$enroll, na.rm=TRUE))
  npop <- nrow(apipop)
  predict(api.ratio, pop$enroll)

  ## regression estimator is less efficient
  api.reg <- svyglm(api.stu~enroll, design=dstrat)
  predict(api.reg, newdata=pop, total=npop)
  ## same as calibration estimator
  svytotal(~api.stu, calibrate(dstrat, ~enroll, pop=c(npop, pop$enroll)))

  ## svyglm can also reproduce the ratio estimator
  api.reg2 <- svyglm(api.stu~enroll-1, design=dstrat,
                    family=quasi(link="identity",var="mu"))
  predict(api.reg2, newdata=pop, total=npop)

  ## higher efficiency by modelling variance better
  api.reg3 <- svyglm(api.stu~enroll-1, design=dstrat,
                    family=quasi(link="identity",var="mu^3"))
  predict(api.reg3, newdata=pop, total=npop)
  ## true value
  sum(apipop$api.stu)

 


