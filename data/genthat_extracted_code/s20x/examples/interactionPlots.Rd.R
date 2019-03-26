library(s20x)


### Name: interactionPlots
### Title: Interactions Plot for Two-way Analysis of Variance
### Aliases: interactionPlots interactionPlots.default
###   interactionPlots.formula
### Keywords: hplot

### ** Examples


data(mtcars)
interactionPlots(wt ~ vs + gear, mtcars)

## note this usage is deprecated
data(mtcars)
with(mtcars, interactionPlots(wt, vs, gear))




