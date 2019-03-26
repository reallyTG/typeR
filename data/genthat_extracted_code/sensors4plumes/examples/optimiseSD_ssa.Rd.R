library(sensors4plumes)


### Name: optimiseSD_ssa
### Title: Spatial Simulated Annealing optimisation algorithm
### Aliases: optimiseSD_ssa

### ** Examples

# the function is to be used inside of optimiseSD
# change parameters
optimSD_ssa1 = replaceDefault(
  optimiseSD_ssa,  newDefaults = list(
    start_acc_vG = 0.1,
    aimCost = 0,
    verbatim = TRUE,
    maxIterations = 3000,
    maxStableIterations = 500,
    maxIterationsJumpBack = 200
  ),
  type = "optimisationFun.optimiseSD")[[1]]

# load data
demo(radioactivePlumes_addProperties)
# define possible, fix, and initial sensors
I = nLocations(radioactivePlumes)
set.seed(22347287)
locDel3 = sample.int(I, 5)
locKeep3 = sample(setdiff(1:I, locDel3), 10)
locAll3 = c(sample(setdiff(1:I,
  c(locDel3, locKeep3)), 10), locDel3)


costInitial1 = multipleDetection(simulations = radioactivePlumes,
  locations = c(locKeep3, locDel3))

# run optimisation
## Not run: 
##D ## takes some time
##D SDssa = optimiseSD(
##D   simulations = radioactivePlumes,
##D   costFun = multipleDetection,
##D   locationsAll = setdiff(1:nLocations(radioactivePlumes), c(locKeep3, locAll3)),
##D   locationsFix = locKeep3,
##D   locationsInitial = locDel3,
##D   aimCost = 0.05 * costInitial1[[1]],
##D   aimNumber = length(locDel3) + length(locKeep3),
##D   optimisationFun = optimSD_ssa1
##D )
## End(Not run)
## this result is also in data(SDssa)

# visualise
data(SDssa)
## cost curve
optimisationCurve(optSD = SDssa, type = "ssa")
## designs
singleDet = replaceDefault(singleDetection, 
  newDefaults = list(plot = TRUE), type = "costFun.optimiseSD")[[1]]
plotSD(radioactivePlumes, 
  SD = SDssa[[1]],
  locationsFix = locKeep3, 
  locationsInitial = locDel3, 
  locationsAll = setdiff(1:nLocations(radioactivePlumes), c(locKeep3, locAll3)),
  costMap = singleDet
)



