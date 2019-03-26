library(survey)


### Name: svyolr
### Title: Proportional odds and related models
### Aliases: svyolr svyolr.survey.design2 svyolr.svyrep.design
### Keywords: survey

### ** Examples

data(api)
dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
dclus1<-update(dclus1, mealcat=cut(meals,c(0,25,50,75,100)))

m<-svyolr(mealcat~avg.ed+mobility+stype, design=dclus1)
m

## Use regTermTest for testing multiple parameters
regTermTest(m, ~avg.ed+stype, method="LRT")



