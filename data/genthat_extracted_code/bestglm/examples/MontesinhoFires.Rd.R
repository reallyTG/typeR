library(bestglm)


### Name: MontesinhoFires
### Title: Forest fires in Montesinho natural park
### Aliases: MontesinhoFires
### Keywords: datasets

### ** Examples

data(MontesinhoFires)
names(MontesinhoFires)
data(Fires)
names(Fires)
#Anova for month
summary(aov(burned~month, data=MontesinhoFires))



