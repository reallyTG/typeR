library(merTools)


### Name: REcorrExtract
### Title: Extract the correlations between the slopes and the intercepts
###   from a model
### Aliases: REcorrExtract

### ** Examples

fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
REcorrExtract(fm1)



