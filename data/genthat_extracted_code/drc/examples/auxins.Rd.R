library(drc)


### Name: auxins
### Title: Effect of technical grade and commercially formulated auxin
###   herbicides
### Aliases: auxins
### Keywords: datasets

### ** Examples


## Fitting model with varying lower limits
auxins.m1 <- boxcox(drm(y ~ dose, h, 
pmodels = data.frame(h, h, 1, h), fct = LL.4(), data = auxins), method = "anova")

## Fitting model with common lower limit
auxins.m2 <- boxcox(drm(y ~ dose, h, 
pmodels = data.frame(h, 1, 1, h), fct = LL.4(), data = auxins), method = "anova")

## Comparing the two models
anova(auxins.m2, auxins.m1)




