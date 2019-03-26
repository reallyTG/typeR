library(survey)


### Name: update.survey.design
### Title: Add variables to a survey design
### Aliases: update.survey.design update.twophase update.svyrep.design
###   update.DBIsvydesign update.ODBCsvydesign
### Keywords: survey manip

### ** Examples

data(api)
dstrat<-svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat,
fpc=~fpc)
dstrat<-update(dstrat, apidiff=api00-api99)
svymean(~api99+api00+apidiff, dstrat)



