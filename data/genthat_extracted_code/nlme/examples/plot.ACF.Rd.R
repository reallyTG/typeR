library(nlme)


### Name: plot.ACF
### Title: Plot an ACF Object
### Aliases: plot.ACF
### Keywords: models

### ** Examples

fm1 <- lme(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary)
plot(ACF(fm1, maxLag = 10), alpha = 0.01)



