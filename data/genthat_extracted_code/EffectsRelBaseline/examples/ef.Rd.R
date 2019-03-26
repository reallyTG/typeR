library(EffectsRelBaseline)


### Name: ef
### Title: Human single neuron responses to race.
### Aliases: ef
### Keywords: datasets

### ** Examples

data(ef)
anova(glm(absResp~race,data=ef),test='Chisq')



