library(quantreg)


### Name: plot.summary.rqs
### Title: Visualizing sequences of quantile regression summaries
### Aliases: plot.summary.rqs
### Keywords: hplot

### ** Examples

## fit Engel models (in levels) for tau = 0.1, ..., 0.9
data("engel")
fm <- rq(foodexp ~ income, data = engel, tau = 1:9/10)
sfm <- summary(fm)

## visualizations
plot(sfm)
plot(sfm, parm = 2, mar = c(5.1, 4.1, 2.1, 2.1), main = "", xlab = "tau", 
  ylab = "income coefficient", cex = 1, pch = 19)



