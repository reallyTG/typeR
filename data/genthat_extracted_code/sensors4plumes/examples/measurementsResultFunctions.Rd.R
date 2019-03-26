library(sensors4plumes)


### Name: mesurementsResultFunctions
### Title: Cost functions by plume-wise summary of values at locations
### Aliases: measurementsResultFunctions singleDetection multipleDetection
###   earlyDetection

### ** Examples

# load data
demo(radioactivePlumes_addProperties)

# define 'min' function without warning for empty sets
min_ = function(x, na.rm = TRUE){
  if (length(x) == 0){ 
    out = Inf
  } else {
    out = min(x, na.rm = na.rm)
  } 
  return(out)
} 

# preprocess data to provide required input  
### earliest possible detection of plume inside the area
radioactivePlumes@plumes$earliestDetection = 
  summaryPlumes(radioactivePlumes, fun = min_, kinds = "time", na.rm = TRUE)[[2]]
  
# sample locations (sensors)
sampleLocations1 = sample.int(nLocations(radioactivePlumes), 10)

# compute cost
singleDetection1 = singleDetection(
  simulations = radioactivePlumes,
  locations = sampleLocations1)
  
multipleDetection1 = multipleDetection(
  simulations = radioactivePlumes,
  locations = sampleLocations1)
  
earlyDetection1 = earlyDetection(
  simulations = radioactivePlumes,
  locations = sampleLocations1)



