library(rqPen)


### Name: beta_plots
### Title: Plots of Betas
### Aliases: beta_plots

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
lassoModels <- cv.rq.pen(x,y)
b_plot <- beta_plots(lassoModels)



