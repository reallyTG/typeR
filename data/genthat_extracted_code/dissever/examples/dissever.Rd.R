library(dissever)


### Name: dissever
### Title: Spatial downscaling
### Aliases: dissever dissever,RasterLayer,RasterStack-method
###   dissever,RasterLayer,RasterLayer-method

### ** Examples

# Load the Edgeroi dataset (see ?edgeroi)
data(edgeroi)

# Plot the Edgeroi dataset (using the raster package)
library(raster)
plot(edgeroi$carbon) # coarse resolution layer
plot(edgeroi$predictors) # fine resolution predictors

# Run dissever using a simple linear model.

# In this instance we are subsampling heavily (p = 0.05) to keep
# run time short
res_lm <- dissever(
  coarse = edgeroi$carbon,
  fine = edgeroi$predictors,
  method = "lm",
  min_iter = 5, max_iter = 10,
  p = 0.05
)

# A lot more models are available through caret:
## Not run: 
##D subset(caret::modelLookup(), forReg == TRUE, select = 'model')
## End(Not run)

# Plot dissever results
plot(res_lm, type = 'map', main = "Dissever using GAM")
plot(res_lm, type = 'perf', main = "Dissever using GAM")




