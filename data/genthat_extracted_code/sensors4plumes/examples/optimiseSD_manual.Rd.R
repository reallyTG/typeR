library(sensors4plumes)


### Name: optimiseSD_manual
### Title: Plot cost map for interactive adding and deleting of sensors
### Aliases: optimiseSD_manual

### ** Examples

# prepare data and functions
data(radioactivePlumes)

meanFun = function(x){mean(x, na.rm = TRUE)}
spatialSpreadMinDist = replaceDefault(
  spatialSpread,
  newDefaults = list(
    weightByArea = TRUE,
    fun = minimalDistance,
    fun_R = meanFun),
  type = "costFun.optimiseSD"
  )[[1]]

radioactivePlumes@locations@data$p1 = getValues(
  subset(radioactivePlumes, plumes = 1, kinds = 1)@values)

optimSD_man_minDist = replaceDefault(
  optimiseSD_manual,
  newDefaults = list(
    costMap = spatialSpreadMinDist
    )
)[["fun"]]

## Not run: 
##D ## interactive optimisation
##D # inside optimiseSD
##D optSD_manual1 = optimiseSD(simulations = radioactivePlumes,
##D                           costFun = spatialSpreadMinDist,
##D                           optimisationFun = optimSD_man_minDist,
##D                           locationsFix = seq(1, 2001, 300),
##D                           locationsInitial = seq(1, 2001, 70),
##D                           locationsAll = setdiff(1:2001, seq(1,2001, 30)))
##D 
##D # directly using optimiseSD_manual
##D optSD_manual2 = optimiseSD_manual(simulations = radioactivePlumes,
##D                                   costFun = spatialSpreadMinDist,
##D                                   costMap = spatialSpreadMinDist,
##D                                   locationsFix = seq(1, 2001, 300),
##D                                   locationsInitial = seq(1, 2001, 70),
##D                                   locationsAll = setdiff(1:2001, seq(1,2001, 30)))
## End(Not run)
## the result of such a manual optimisation is in data(SDmanual)



