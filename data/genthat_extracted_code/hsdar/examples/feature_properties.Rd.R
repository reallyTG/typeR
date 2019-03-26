library(hsdar)


### Name: feature_properties
### Title: Calculation of properties of features
### Aliases: feature_properties
### Keywords: multivariate

### ** Examples

data(spectral_data)

## Example calculating the areas of the features around 450nm, 
## 700nm, 1200nm and 1500nm.
bd <- transformSpeclib(subset(spectral_data, season == "summer"),
                       method = "sh", out = "bd")

## Convert speclib to specfeat giving center wavelength of features
featureSelection <- specfeat(bd, c(450,700,1200,1500))

## Calculate properties of features
featureProp <- feature_properties(featureSelection)

## See resulting feature property variables
head(SI(featureProp))



