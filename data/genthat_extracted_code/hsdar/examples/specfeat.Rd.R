library(hsdar)


### Name: specfeat
### Title: Function to isolate absorption features
### Aliases: specfeat [,Specfeat,ANY,ANY,ANY-method n_features
###   n_features,Specfeat-method
### Keywords: classes aplot

### ** Examples

data(spectral_data)

## Transform speclib
bd <- transformSpeclib(spectral_data, method = "sh", out = "bd")

##Example to isolate the features around 450nm, 700nm, 1200nm and 1500nm.
featureSelection <- specfeat(bd, c(450,700,1200,1500))

## Plot features
plot(featureSelection)

## Advanced plotting example
plot(featureSelection, 1:2, stylebysubset = "season")

plot(featureSelection, 1:2, stylebysubset = "season", changecol = FALSE, 
     changetype = TRUE)



