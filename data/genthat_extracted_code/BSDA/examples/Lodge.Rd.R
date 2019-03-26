library(BSDA)


### Name: Lodge
### Title: Measured traffic at three prospective locations for a motor
###   lodge
### Aliases: Lodge
### Keywords: datasets

### ** Examples


boxplot(traffic ~ site, data = Lodge, col = cm.colors(3))
anova(lm(traffic ~ factor(site), data = Lodge))




