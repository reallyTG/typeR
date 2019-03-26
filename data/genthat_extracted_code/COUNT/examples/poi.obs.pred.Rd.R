library(COUNT)


### Name: poi.obs.pred
### Title: Table of Poisson counts: observed vs predicted proportions and
###   difference
### Aliases: poi.obs.pred
### Keywords: table

### ** Examples


data(medpar)
mdpar <- glm(los ~ hmo+white+type2+type3, family=poisson, data=medpar, y=TRUE, model=TRUE)
poi.obs.pred(len=25, model=mdpar)



