library(hsdar)


### Name: plot.Specfeat
### Title: Plot Specfeat
### Aliases: plot.Specfeat plot,Specfeat,ANY-method plot,Specfeat-method
### Keywords: aplot

### ** Examples

## Not run: 
##D data(spectral_data)
##D 
##D ## Transform speclib
##D bd <- transformSpeclib(spectral_data, method = "sh", out = "bd")
##D 
##D ##Example to isolate the features around 450nm, 700nm, 1200nm and 1500nm.
##D featureSelection <- specfeat(bd, c(450,700,1200,1500))
##D 
##D ## Plot features
##D plot(featureSelection)
##D 
##D ## Advanced plotting example
##D plot(featureSelection, 1:2, stylebysubset = "season")
##D 
##D plot(featureSelection, 1:2, stylebysubset = "season", changecol = FALSE, 
##D      changetype = TRUE)
## End(Not run)



