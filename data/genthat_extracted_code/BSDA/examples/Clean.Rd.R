library(BSDA)


### Name: Clean
### Title: Residual contaminant following the use of three different
###   cleansing agents
### Aliases: Clean
### Keywords: datasets

### ** Examples


boxplot(clean ~ agent, col = c("red", "blue", "green"), data = Clean)
anova(lm(clean ~ agent, data = Clean))




