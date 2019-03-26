library(sensors4plumes)


### Name: optimiseSD_greedy
### Title: Greedy optimisation algorithm
### Aliases: optimiseSD_greedy

### ** Examples

# optimisation function: is to be used inside of optimiseSD
# change parameters 'swap' and 'maxIterations'
optGr_20_true = replaceDefault(
  optimiseSD_greedy,
  newDefaults = list(
    maxIterations = 20,
    swap = TRUE)
)
# cost function
meanFun = function(x){mean(x, na.rm = TRUE)}
minDist = replaceDefault(
  spatialSpread, newDefaults = list(
    fun = minimalDistance,
    fun_R = meanFun
  ), type = "costFun.optimiseSD"
)[["fun"]]

# define possible, fix, and initial sensors
data(SimulationsSmall)
I = nLocations(SimulationsSmall)
set.seed(9345872)
locInit1 = sample.int(I, 2)
locKeep1 = sample(setdiff(1:I, locInit1), 2)
locAll1 = c(sample(setdiff(1:I, c(locInit1, locKeep1)), 4), locInit1)

# run optimisation
## Not run: 
##D ## takes some time
##D optSD_greedy = optimiseSD(
##D   simulations = SimulationsSmall,
##D   costFun = minDist,
##D   optimisationFun = optGr_20_true[[1]],
##D   locationsAll = locAll1,
##D   locationsFix = locKeep1,
##D   locationsInitial = locInit1,
##D   aimNumber = 7
##D )
##D 
## End(Not run)
## this result is also in data(SDgreedy)



