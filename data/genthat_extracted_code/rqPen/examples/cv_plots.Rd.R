library(rqPen)


### Name: cv_plots
### Title: Plots of Cross-validation results
### Aliases: cv_plots

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
lassoModels <- cv.rq.pen(x,y)
cv_plot <- cv_plots(lassoModels)



