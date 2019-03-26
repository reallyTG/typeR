library(survey)


### Name: dimnames.DBIsvydesign
### Title: Dimensions of survey designs
### Aliases: dimnames.DBIsvydesign dimnames.ODBCsvydesign
###   dimnames.survey.design dimnames.svyrep.design dimnames.twophase
###   dimnames.svyimputationList dim.DBIsvydesign dim.ODBCsvydesign
###   dim.survey.design dim.twophase dim.svyimputationList
###   dim.svyrep.design
### Keywords: survey manip

### ** Examples

data(api)
dclus1 <- svydesign(ids=~dnum,weights=~pw,data=apiclus1,fpc=~fpc)
dim(dclus1)
dimnames(dclus1)
colnames(dclus1)



