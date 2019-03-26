library(MESS)


### Name: residualplot.default
### Title: Plots a standardaized residual
### Aliases: residualplot.default residualplot.lm residualplot.glm
###   residualplot
### Keywords: hplot

### ** Examples


# Linear regression example
data(trees)
model <- lm(Volume ~ Girth + Height, data=trees)
residualplot(model)
model2 <- lm(Volume ~ Girth + I(Girth^2) + Height, data=trees)
residualplot(model2)




