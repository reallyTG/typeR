library(ENiRG)


### Name: cbi.results
### Title: List with values returned from 'boyce'.
### Aliases: cbi.results
### Keywords: datasets

### ** Examples

data(apis.hsm)

# vector of predictions for observations:
apis.predictions <- apis.hsm$predictions[, 2]

# vector of predictions for the entire predicted map:
apis.predictions.map <- as.vector(na.exclude(apis.hsm$African_predicted_hsm@data@values))

# Try with intervals:
# unsuitable = 0.65
# marginal = 0.84
# suitable = 0.96
# Note that this species has an optimal distribution
# in the study area, resulting in a wide unsuitable
# interval and narrow suitable ones.

boyce(prediction = apis.predictions,
      prediction.map = apis.predictions.map,
      categories = c(0, 0.65, 0.84, 0.96, 1),
      cv.sets = 10, type = "none")
      
data(cbi.results)
cbi.results



