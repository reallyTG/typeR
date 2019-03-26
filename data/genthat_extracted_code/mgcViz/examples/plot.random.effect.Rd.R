library(mgcViz)


### Name: plot.multi.random.effect
### Title: Plotting random effects
### Aliases: plot.multi.random.effect plot.random.effect

### ** Examples

library(mgcViz)
b <- gam(travel~s(Rail,bs="re"), data=Rail, method="REML")
b <- getViz(b)
plot(sm(b, 1)) + l_fitLine(colour = 2, linetype = 2) + l_points() + 
  l_ciLine(colour = 4, linetype = 3)

plot(sm(b, 1)) + l_ciPoly() + l_points()

# Default
plot(b)

###
# Quantile GAM version
###
b <- mqgamV(travel~s(Rail,bs="re"), data=as.data.frame(Rail), qu = c(0.2, 0.4, 0.6, 0.8))

plot(sm(b, 1)) + l_ciPoly() + l_points()

# Default
plot(b)




