library(quantreg)


### Name: plot.rqs
### Title: Visualizing sequences of quantile regressions
### Aliases: plot.rqs
### Keywords: hplot

### ** Examples

## fit Engel models (in levels) for tau = 0.1, ..., 0.9
data("engel")
fm <- rq(foodexp ~ income, data = engel, tau = 1:9/10)

## visualizations
plot(fm)
plot(fm, parm = 2, mar = c(5.1, 4.1, 2.1, 2.1), main = "", xlab = "tau", 
  ylab = "income coefficient", cex = 1, pch = 19)



