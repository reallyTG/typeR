library(nlme)


### Name: plot.Variogram
### Title: Plot a Variogram Object
### Aliases: plot.Variogram
### Keywords: models

### ** Examples

fm1 <- lme(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary)
plot(Variogram(fm1, form = ~ Time | Mare, maxDist = 0.7))



