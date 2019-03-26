library(survey)


### Name: weights.survey.design
### Title: Survey design weights
### Aliases: weights.survey.design weights.svyrep.design weights.survey_fpc
### Keywords: survey

### ** Examples

data(scd)


scddes<-svydesign(data=scd, prob=~1, id=~ambulance, strata=~ESA,
                 nest=TRUE, fpc=rep(5,6))
repweights<-2*cbind(c(1,0,1,0,1,0), c(1,0,0,1,0,1), c(0,1,1,0,0,1), c(0,1,0,1,1,0))
scdrep<-svrepdesign(data=scd, type="BRR", repweights=repweights)

weights(scdrep)
weights(scdrep, type="sampling")
weights(scdrep, type="analysis")
weights(scddes)




