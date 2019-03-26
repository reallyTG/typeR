library(nima)


### Name: qqPlot_gg
### Title: Quantile-Quantile Plots with ggplot2
### Aliases: qqPlot_gg

### ** Examples

n <- 100; x1 <- rnorm(n); y1 <- rnorm(n);
linmod <- lm(y1 ~ x1)
x <- linmod$residuals
qqPlot_gg(x)



