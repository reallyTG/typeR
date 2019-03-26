library(R330)


### Name: influenceplots
### Title: Draws plots of influence measures
### Aliases: influenceplots influenceplots.lm influenceplots.glm
###   influenceplots.formula
### Keywords: aplot

### ** Examples

data(educ.df)
educ.lm = lm(educ~urban + percap + under18, data=educ.df)
par(mfrow=c(2,4))
influenceplots(educ.lm)
#
influenceplots(educ~urban + percap + under18, data=educ.df)



