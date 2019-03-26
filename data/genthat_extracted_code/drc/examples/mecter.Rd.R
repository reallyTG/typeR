library(drc)


### Name: mecter
### Title: Mechlorprop and terbythylazine tested on Lemna minor
### Aliases: mecter
### Keywords: datasets

### ** Examples


## Fitting the model with freely varying ED50 values
mecter.free <- drm(rgr ~ dose, pct, data = mecter, 
fct = LL.4(), pmodels = list(~1, ~1, ~1, ~factor(pct) - 1)) 

## Lack-of-fit test
modelFit(mecter.free)  # not really acceptable
summary(mecter.free)

## Plotting isobole structure
isobole(mecter.free, exchange = 0.02)

## Fitting the concentration addition model
mecter.ca <- mixture(mecter.free, model = "CA")

## Comparing to model with freely varying e parameter
anova(mecter.ca, mecter.free)  # rejected

## Plotting isobole based on concentration addition
isobole(mecter.free, mecter.ca, exchange = 0.02)  # poor fit

## Fitting the Hewlett model
mecter.hew <- mixture(mecter.free, model = "Hewlett")

## Comparing to model with freely varying e parameter
anova(mecter.hew, mecter.free)  # rejected

## Plotting isobole based on the Hewlett model
isobole(mecter.free, mecter.hew, exchange = 0.02)  # poor fit

## Fitting the Voelund model
mecter.voe<-mixture(mecter.free, model = "Voelund")

## Comparing to model with freely varying e parameter
anova(mecter.voe, mecter.free)  # accepted

## Plotting isobole based on the Voelund model
isobole(mecter.free, mecter.voe, exchange = 0.02)  # good fit




