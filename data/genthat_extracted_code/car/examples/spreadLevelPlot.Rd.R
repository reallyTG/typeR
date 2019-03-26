library(car)


### Name: spreadLevelPlot
### Title: Spread-Level Plots
### Aliases: spreadLevelPlot slp spreadLevelPlot.formula
###   spreadLevelPlot.default spreadLevelPlot.lm print.spreadLevelPlot
### Keywords: hplot regression

### ** Examples

spreadLevelPlot(interlocks + 1 ~ nation, data=Ornstein)
slp(lm(interlocks + 1 ~ assets + sector + nation, data=Ornstein))



