library(hsdar)


### Name: bdri
### Title: Band depth ratio indices
### Aliases: bdri
### Keywords: utilities

### ** Examples

data(spectral_data)

## Transform speclib
bd <- transformSpeclib(subset(spectral_data, season == "summer"),
                       method = "sh", out = "bd")

## Isolate the features around 450nm, 700nm, 1200nm and 1500nm and 
## convert to specfeat.
featureSelection <- specfeat(bd, c(450,700,1200,1500))

## Plot features
plot(featureSelection,1:4)

## Calculate normalized band depth index for first feature
featureSelection_bdri <- bdri(featureSelection, 1, index = "ndbi")

## Plot result
plot(featureSelection_bdri)



