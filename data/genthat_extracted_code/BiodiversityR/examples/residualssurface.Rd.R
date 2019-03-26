library(BiodiversityR)


### Name: residualssurface
### Title: Show and Interpolate Two Dimensional Distribution of Residuals
### Aliases: residualssurface
### Keywords: multivariate

### ** Examples

library(vegan)
library(mgcv)
library(akima)
data(faramea)
Count.model1 <- lm(Faramea.occidentalis ~ Precipitation,
    data=faramea, na.action=na.exclude)
surface.1 <- residualssurface(Count.model1, na.omit(faramea),
    'UTM.EW', 'UTM.NS', gam=TRUE, plotit=TRUE, bubble=TRUE)



