library(drc)


### Name: glymet
### Title: Glyphosate and metsulfuron-methyl tested on algae.
### Aliases: glymet
### Keywords: datasets

### ** Examples



## Fitting the model with freely varying ED50 values
glymet.free <- drm(rgr~dose, pct, data = glymet, 
fct = LL.3(), pmodels = list(~factor(pct) , ~1, ~factor(pct))) 

## Lack-of-fit test
modelFit(glymet.free)  # acceptable
summary(glymet.free)

## Plotting isobole structure
isobole(glymet.free, exchange=0.01)

## Fitting the concentration addition model
glymet.ca <- mixture(glymet.free, model = "CA")

## Comparing to model with freely varying e parameter
anova(glymet.ca, glymet.free)  # borderline accepted

## Plotting isobole based on concentration addition
isobole(glymet.free, glymet.ca, exchange = 0.01)  # acceptable fit

## Fitting the Hewlett model
glymet.hew <- mixture(glymet.free, model = "Hewlett")

### Comparing to model with freely varying e parameter
anova(glymet.ca, glymet.hew)  
# borderline accepted
# the Hewlett model offers no improvement over concentration addition

## Plotting isobole based on the Hewlett model
isobole(glymet.free, glymet.hew, exchange = 0.01)  
# no improvement over concentration addition




