library(survey)


### Name: svydesign
### Title: Survey sample analysis.
### Aliases: svydesign svydesign.default svydesign.imputationList
###   svydesign.character na.omit.survey.design na.exclude.survey.design
###   na.fail.survey.design
### Keywords: survey univar manip

### ** Examples

  data(api)
# stratified sample
dstrat<-svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
# one-stage cluster sample
dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
# two-stage cluster sample: weights computed from population sizes.
dclus2<-svydesign(id=~dnum+snum, fpc=~fpc1+fpc2, data=apiclus2)

## multistage sampling has no effect when fpc is not given, so
## these are equivalent.
dclus2wr<-svydesign(id=~dnum+snum, weights=weights(dclus2), data=apiclus2)
dclus2wr2<-svydesign(id=~dnum, weights=weights(dclus2), data=apiclus2)

## syntax for stratified cluster sample
##(though the data weren't really sampled this way)
svydesign(id=~dnum, strata=~stype, weights=~pw, data=apistrat,
nest=TRUE)

## PPS sampling without replacement
data(election)
dpps<- svydesign(id=~1, fpc=~p, data=election_pps, pps="brewer")

##database example: requires RSQLite
## Not run: 
##D library(RSQLite)
##D dbclus1<-svydesign(id=~dnum, weights=~pw, fpc=~fpc,
##D data="apiclus1",dbtype="SQLite", dbname=system.file("api.db",package="survey"))
##D 
## End(Not run)



