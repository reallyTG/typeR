library(ACSWR)


### Name: SP
### Title: Understanding Strength of Paper with a Three Factorial
###   Experiment
### Aliases: SP
### Keywords: ANOVA

### ** Examples

data(SP)
summary(SP.aov <- aov(Strength~.^3,SP))



