library(car)


### Name: residualPlots
### Title: Residual Plots for Linear and Generalized Linear Models
### Aliases: residualPlots residualPlots.default residualPlots.lm
###   residualPlots.glm residualPlot residualPlot.default residualPlot.lm
###   residualPlot.glm residCurvTest residCurvTest.lm residCurvTest.glm
###   tukeyNonaddTest
### Keywords: hplot regression

### ** Examples

m1 <- lm(prestige ~ income, data=Prestige)
residualPlots(m1)
residualPlots(m1, terms= ~ 1 | type) # plot vs. yhat grouping by type



