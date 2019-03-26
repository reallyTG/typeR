library(sensors4plumes)


### Name: plotSD
### Title: Plot sampling designs and related cost maps
### Aliases: plotSD

### ** Examples

demo(radioactivePlumes_addProperties) 
data(SDssa)
SDs = list(SDssa[["SD"]][[1]][1,], SDssa$report[["SD_final"]])
singleDet = replaceDefault(singleDetection, 
  newDefaults = list(plot = TRUE), type = "costFun.optimiseSD")[[1]]
# separate maps
plotSD1a = plotSD(
  simulations = radioactivePlumes,
  SD = SDs,
  costMap = singleDet)
for (i in seq(along = SDs)){
  plot(plotSD1a[[i]])
}
  
# combined map (with customised parameters for fix and initial sensors)
I = nLocations(radioactivePlumes)
set.seed(22347287) # reconstruct initial and fix sensors of SDssa
locDel3 = sample.int(I, 5)
locKeep3 = sample(setdiff(1:I, locDel3), 10)
locAll3 = c(sample(setdiff(1:I, 
  c(locDel3, locKeep3)), 10), locDel3)

plotSD2 = plotSD(
  simulations = radioactivePlumes,
  SD = SDs,
  locationsAll = setdiff(1:nLocations(radioactivePlumes), c(locKeep3, locAll3)),
  locationsFix = locKeep3,
  locationsInitial = locDel3,
  costMap = singleDet,
  allIn1Plot = 2,
  col = c("green", "blue", "red", "white"),
  pch = c(1,2,4),
  col.regions = grey.colors,
  colorkey = FALSE)  


# combined map (with customised parameters for different SDs)   
plotSD3 = plotSD(
  simulations = radioactivePlumes,
  SD = SDs,
  locationsFix = locKeep3,
  locationsAll = setdiff(1:nLocations(radioactivePlumes), c(locKeep3, locAll3)), 
  allIn1Plot = 2,
  col = c(1, "white", "white", "white"),
  pch = c(1,20,0),
  col.regions = grey.colors,
  pointsKey = FALSE,
  pch.SDs = 2:5,
  cex.SDs = c(3.5,3,2.5,2),
  col.SDs = 4:8
  )  



