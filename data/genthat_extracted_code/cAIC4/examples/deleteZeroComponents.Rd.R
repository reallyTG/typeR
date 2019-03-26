library(cAIC4)


### Name: deleteZeroComponents
### Title: Delete random effect terms with zero variance
### Aliases: deleteZeroComponents
### Keywords: regression

### ** Examples


## Currently no data with variance equal to zero...
b <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

deleteZeroComponents(b)




