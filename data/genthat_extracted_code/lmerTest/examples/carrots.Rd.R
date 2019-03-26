library(lmerTest)


### Name: carrots
### Title: Consumer Preference Mapping of Carrots
### Aliases: carrots
### Keywords: datasets

### ** Examples


fm <- lmer(Preference ~ sens2 + Homesize + (1 + sens2 | Consumer), data=carrots)
anova(fm)




