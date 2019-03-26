library(calibrar)


### Name: calibrarDemo
### Title: Demos for the calibrar package
### Aliases: calibrarDemo
### Keywords: calibration demo

### ** Examples

## Not run: 
##D require(calibrar)
##D set.seed(880820)
##D path = NULL # NULL to use the current directory
##D # create the demonstration files
##D demo = calibrarDemo(model="PoissonMixedModel", L=5, T=100)
##D # get calibration information
##D calibrationInfo = getCalibrationInfo(path=demo$path)
##D # get observed data
##D observed = getObservedData(info=calibrationInfo, path=demo$path)
##D # read forcings for the model
##D forcing = read.csv(file.path(demo$path, "master", "environment.csv"), row.names=1)
##D # Defining 'runModel' function
##D runModel = function(par, forcing) {
##D output = calibrar:::.PoissonMixedModel(par=par, forcing=forcing)
##D # adding gamma parameters for penalties
##D output = c(output, list(gammas=par$gamma))
##D return(output)
##D }
##D # real parameters
##D cat("Real parameters used to simulate data\n")
##D print(demo$par)
##D # objective functions
##D obj  = createObjectiveFunction(runModel=runModel, info=calibrationInfo,
##D                                observed=observed, forcing=forcing)
##D cat("Starting calibration...\n")
##D control = list(weights=calibrationInfo$weights, maxit=3.6e5) # control parameters
##D cat("Running optimization algorithms\n", "\t", date(), "\n")
##D cat("Running optim AHR-ES\n")
##D ahr = calibrate(par=demo$guess, fn=obj, lower=demo$lower, upper=demo$upper, control=control)
##D summary(ahr)
## End(Not run)



