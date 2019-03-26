library(nima)


### Name: lmPlots_gg
### Title: Linear Model Diagnostic Plots with ggplot2
### Aliases: lmPlots_gg

### ** Examples

n <- 100; x1 <- rnorm(n); y1 <- rnorm(n);
linmod <- lm(y1 ~ x1)
lmPlots_gg(linmod)



