library(lmerTest)


### Name: TVbo
### Title: Sensory Assesment of B&O TVs
### Aliases: TVbo
### Keywords: datasets

### ** Examples


fm <- lmer(Coloursaturation ~ TVset + Picture + (1|Assessor:TVset) +
             (1|Assessor), data=TVbo)
ranova(fm)
anova(fm)




