library(sars)


### Name: plot.multi
### Title: Plot Model Fits for a 'multi' Object
### Aliases: plot.multi

### ** Examples

data(galap)
#plot a multimodel SAR curve with all model fits included
fit <- sar_multi(galap)
plot(fit)

#remove the legend
plot(fit, pLeg = FALSE)

#plot just the multimodel curve
plot(fit, allCurves = FALSE, ModTitle = "", lcol = "black")

#Plot a barplot of the model weights
plot(fit, type = "bar")
#subset to plot only models with weight > 0.05
plot(fit, type = "bar", subset_weights = 0.05)



