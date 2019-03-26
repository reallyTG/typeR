library(trafo)


### Name: glog
### Title: Glog transformation for linear models
### Aliases: glog

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable 
glog(object = lm_cars)



