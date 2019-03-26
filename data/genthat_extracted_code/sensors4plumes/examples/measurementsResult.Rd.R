library(sensors4plumes)


### Name: measurementsResult
### Title: General cost function by plume-wise summary of values at
###   locations
### Aliases: measurementsResult

### ** Examples

demo(radioactivePlumes_addProperties)
  
# sensor locations
sampleLocations1 = sample.int(nLocations(radioactivePlumes), 10)

# modify 'measurementsResult' to cost function 'singleDetection' 
singleDetection = replaceDefault(measurementsResult, newDefaults = list(
  kinds = "detectable",
  fun_p = function(x, nout = 1){
    y = 1 - max(x)
    if (length(x) == 0){
      y = 1
    }
    return(y)
    },
  fun_Rp = function(x, weight = 1, nout = 1){
    mean(x * weight$totalDose)/mean(weight$totalDose)
  }),
  type = "costFun.optimiseSD")[[1]]  

# compute cost for sensors at 'sampleLocations1'
  singleDetection1 = singleDetection(
    simulations = radioactivePlumes,
    locations = sampleLocations1) 
    
# results
# global cost: fraction of non detected plumes, weighted by their total dose:
singleDetection1[["cost"]] 
singleDetection1[["costPlumes"]] # for each plume if it is detected (0) or not (1)



