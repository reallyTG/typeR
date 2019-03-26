library(car)


### Name: ceresPlots
### Title: Ceres Plots
### Aliases: ceresPlots ceresPlot ceresPlot.lm ceresPlot.glm
### Keywords: hplot regression

### ** Examples

ceresPlots(lm(prestige~income+education+type, data=Prestige), terms= ~ . - type)



