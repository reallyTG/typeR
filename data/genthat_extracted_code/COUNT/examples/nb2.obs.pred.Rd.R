library(COUNT)


### Name: nb2.obs.pred
### Title: Table of negative binomial counts: observed vs predicted
###   proportions and difference
### Aliases: nb2.obs.pred
### Keywords: table

### ** Examples

library(MASS)

data(medpar)
mdpar <- glm.nb(los ~ hmo+white+type2+type3, data=medpar, y=TRUE, model=TRUE)
nb2.obs.pred(len=25, model=mdpar)



