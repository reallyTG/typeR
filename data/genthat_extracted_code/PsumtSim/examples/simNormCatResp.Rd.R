library(PsumtSim)


### Name: simNormCatResp
### Title: Simulates normally distributed responses to stimuli.
### Aliases: simNormCatResp
### Keywords: datagen

### ** Examples

simNormCatResp(10.0,c(10,20,30),5)->sim2
anova(glm(resp~category,data=sim2),test='F')



