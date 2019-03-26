library(MTLR)


### Name: plotcurves
### Title: Graphically Visualize MTLR Survival Curves
### Aliases: plotcurves

### ** Examples

#Set up the example:
library(survival)
mod <- mtlr(Surv(time,status)~., data = lung)
curves <- predict(mod, type = "survivalcurve")

plotcurves(curves, 1:10)
plotcurves(curves, 1:3, color = c("red","blue","purple"))
plotcurves(curves, 1:10, xlim = c(0,42))

#Note the legend is now gone:
plotcurves(curves, 1:20)

#and it is back again:
plotcurves(curves, 1:20, remove_legend = FALSE)



