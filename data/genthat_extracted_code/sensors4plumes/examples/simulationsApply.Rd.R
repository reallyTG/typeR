library(sensors4plumes)


### Name:  simulationsApply 
### Title: Apply functions value-wise, location-wise, or plume-wise to
###   Simulations
### Aliases: simulationsApply

### ** Examples

## Not run: 
##D ## may create files
##D demo(radioactivePlumes_addProperties)
##D 
##D # number of not detected plumes for given set of 10 sensors, 
##D # weighted by total dose of plumes
##D sensors = sample.int(nLocations(radioactivePlumes), 10)
##D   
##D nondetection = function(x, threshold = 1e-7, nout = 1){ 
##D   all(x[,2] < threshold)
##D }
##D 
##D sumWeighted = function(x, weight, nout = 1){
##D   sum(x * weight$totalDose)
##D }
##D 
##D weightedSumUndetectedAtSensors = simulationsApply(
##D   simulations = radioactivePlumes,
##D   locations = sensors,
##D   fun_p = nondetection,
##D   fun_Rp = sumWeighted
##D )
##D 
##D # map of average time until detection of plumes
##D # if a plume never reaches a location it is counted as being there after a week
##D meanDetectionTime = function(x, nout = 1){
##D   y = x
##D   y[is.na(x)] = 7 * 86400 
##D   z = mean(y, na.rm = TRUE)
##D }
##D 
##D mapMeanDetectionTime = simulationsApply(
##D   simulations = radioactivePlumes,
##D   kinds = 3,
##D   fun_l = meanDetectionTime
##D )
##D radioactivePlumes@locations@data$meanDetectionTime = 
##D   mapMeanDetectionTime[["result_locations"]]
##D spplot(radioactivePlumes@locations, zcol = "meanDetectionTime")
##D 
##D # general ratio and difference of 'maxdose' and 'finaldose'
##D ratioMaxFinal =  function(x, nout = 2){
##D   ratio = x[2]/x[1]
##D   diff = x[2] - x[1]
##D   ratio[!is.finite(ratio)] = NA
##D   out = c(ratio, diff)
##D }
##D valuesRatio = simulationsApply(
##D   simulations = radioactivePlumes,
##D   fun_pl = ratioMaxFinal,
##D   fun_Rpl_cellStats = "mean",
##D   nameSave = "ratio"
##D )
##D hist(valuesRatio[["result_locationsplumes"]], 1, 
##D   xlim = c(0,1), breaks = c(seq(0, 1, 0.01), 10000))
##D hist(valuesRatio[["result_locationsplumes"]], 2, 
##D   xlim = c(-0.001, 0.001), breaks = c(-1000, seq(-0.001, 0.001, 0.0001), 1000))
##D 
## End(Not run)




