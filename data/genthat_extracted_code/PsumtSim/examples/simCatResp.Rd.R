library(PsumtSim)


### Name: simCatResp
### Title: Simulates Poisson distributed responses to stimuli.
### Aliases: simCatResp
### Keywords: datagen

### ** Examples

simCatResp(10.0,c(10,20,30),5)->sim1
anova(glm(resp~category,data=sim1),test='F')



