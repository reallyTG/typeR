library(BaTFLED3D)


### Name: plot_preds
### Title: Make a scatterplot of observed vs. predicted values
### Aliases: plot_preds

### ** Examples

x <- seq(-10,10, 0.01)+rnorm(2001)
y <- seq(-10,10, 0.01)+rnorm(2001)
x[sample(2001, 100)] <- NA
plot_preds(y, x)



