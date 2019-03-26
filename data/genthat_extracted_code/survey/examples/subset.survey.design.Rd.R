library(survey)


### Name: subset.survey.design
### Title: Subset of survey
### Aliases: subset.survey.design subset.svyrep.design [.survey.design
### Keywords: survey manip

### ** Examples

data(fpc)
dfpc<-svydesign(id=~psuid,strat=~stratid,weight=~weight,data=fpc,nest=TRUE)
dsub<-subset(dfpc,x>4)
summary(dsub)
svymean(~x,design=dsub)

## These should give the same domain estimates and standard errors
svyby(~x,~I(x>4),design=dfpc, svymean)
summary(svyglm(x~I(x>4)+0,design=dfpc))

data(api)
dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
rclus1<-as.svrepdesign(dclus1)
svymean(~enroll, subset(dclus1, sch.wide=="Yes" & comp.imp=="Yes"))
svymean(~enroll, subset(rclus1, sch.wide=="Yes" & comp.imp=="Yes"))




