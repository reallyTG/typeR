library(drc)


### Name: acidiq
### Title: Acifluorfen and diquat tested on Lemna minor.
### Aliases: acidiq
### Keywords: datasets

### ** Examples


## Fitting the model with freely varying ED50 values
## Ooops: Box-Cox transformation is needed
acidiq.free <- drm(rgr ~ dose, pct, data = acidiq, fct = LL.4(),
pmodels = list(~factor(pct), ~1, ~1, ~factor(pct) - 1))

## Lack-of-fit test
modelFit(acidiq.free)
summary(acidiq.free)

## Plotting isobole structure
isobole(acidiq.free, xlim = c(0, 400), ylim = c(0, 450))

## Fitting the concentration addition model
acidiq.ca <- mixture(acidiq.free, model = "CA")

## Comparing to model with freely varying e parameter
anova(acidiq.ca, acidiq.free)  # rejected

## Plotting isobole based on concentration addition -- poor fit
isobole(acidiq.free, acidiq.ca, xlim = c(0, 420), ylim = c(0, 450))  # poor fit

## Fitting the Hewlett model
acidiq.hew <- mixture(acidiq.free, model = "Hewlett")

## Comparing to model with freely varying e parameter
anova(acidiq.free, acidiq.hew)  # accepted
summary(acidiq.hew)

## Plotting isobole based on the Hewlett model
isobole(acidiq.free, acidiq.hew, xlim = c(0, 400), ylim = c(0, 450))  # good fit




