library(survey)


### Name: svytable
### Title: Contingency tables for survey data
### Aliases: svreptable svytable svytable.svyrep.design
###   svytable.survey.design svychisq svychisq.survey.design
###   svychisq.svyrep.design summary.svytable print.summary.svytable
###   summary.svreptable degf degf.svyrep.design degf.survey.design2
###   degf.twophase
### Keywords: survey category htest

### ** Examples

  data(api)
  xtabs(~sch.wide+stype, data=apipop)

  dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
  summary(dclus1)

  (tbl <- svytable(~sch.wide+stype, dclus1))
  plot(tbl)
  fourfoldplot(svytable(~sch.wide+comp.imp+stype,design=dclus1,round=TRUE), conf.level=0)

  svychisq(~sch.wide+stype, dclus1)
  summary(tbl, statistic="Chisq")
  svychisq(~sch.wide+stype, dclus1, statistic="adjWald")

  rclus1 <- as.svrepdesign(dclus1)
  summary(svytable(~sch.wide+stype, rclus1))
  svychisq(~sch.wide+stype, rclus1, statistic="adjWald")




