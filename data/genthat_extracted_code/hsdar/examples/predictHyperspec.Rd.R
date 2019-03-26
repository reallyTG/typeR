library(hsdar)


### Name: predictHyperspec
### Title: Prediction based on train-object and Speclib
### Aliases: predictHyperspec
###   predictHyperspec,train,.CaretHyperspectral,function-method
###   predictHyperspec,train,.CaretHyperspectral,missing-method
### Keywords: utilities

### ** Examples

## Not run: 
##D ## The following example is taken from the journal paper 
##D ## "Hyperspectral Data Analysis in R: the hsdar Package"
##D ## under review at the "Journal of Statistical Software"
##D   
##D data(spectral_data)
##D 
##D spectral_data <- noiseFiltering(spectral_data, method = "sgolay", p = 15)
##D 
##D ## Convert the chlorophyll measurements stored in the SI dataframe 
##D ## from SPAD-values into mg.
##D SI(spectral_data)$chlorophyll <- 
##D   (117.1 * SI(spectral_data)$chlorophyll) /
##D   (148.84 - SI(spectral_data)$chlorophyll)
##D   
##D ## Mask spectra  
##D spectral_data <- spectral_data[, wavelength(spectral_data) >= 310 & 
##D   wavelength(spectral_data) <= 1000]
##D 
##D ## Transform reflectance values into band depth applying a segmented upper hull
##D ## continuum removal.  
##D spec_bd <- transformSpeclib(spectral_data, method = "sh", out = "bd")
##D 
##D ## Select the chlorophyll absorption features at 460 nm and 670 nm for further
##D ## processing
##D featureSpace <- specfeat(spec_bd, c(460, 670))
##D 
##D ## Calculate all parameters from both selected features such as area, distance
##D ## to Gauss curve etc.
##D featureSpace <- feature_properties(featureSpace)
##D 
##D ## Set response and additional predictor variables for random forest model
##D featureSpace <- setResponse(featureSpace, "chlorophyll")
##D featureSpace <- setPredictor(featureSpace,
##D   names(SI(featureSpace))[4:ncol(SI(featureSpace))])
##D 
##D ## Define training and cross validation for random forest model tuning
##D ctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 5)
##D 
##D ## Partition data set for training and validation
##D training_validation <- createDataPartition(featureSpace)
##D 
##D ## Train random forest model based on training-subset
##D rfe_trained <- train(featureSpace[training_validation$Resample1,], 
##D                      trainControl = ctrl, method = "rf")  
##D 
##D ## Predict on the validation data set
##D pred <- predictHyperspec(rfe_trained, featureSpace[-training_validation$Resample1,])
##D 
##D ## Plot result for visual interpretation
##D lim <- range(c(SI(featureSpace,i = -training_validation$Resample1)$chlorophyll,
##D                pred))
##D plot(SI(featureSpace,i = -training_validation$Resample1)$chlorophyll, pred,
##D      ylab = "Predicted chlorophyll content",
##D      xlab = "Estimated chlorophyll content", 
##D      xlim = lim, ylim = lim)
##D lines(par()$usr[c(1,2)],par()$usr[c(3,4)], lty = "dotted")
## End(Not run)



