library(Wats)


### Name: PolarPeriodic
### Title: Polar Plot with Periodic Elements
### Aliases: PolarPeriodic
### Keywords: polar

### ** Examples

library(grid)
library(Wats)
dsLinear <- CountyMonthBirthRate2005Version
dsLinear <- dsLinear[dsLinear$CountyName=="oklahoma", ]
dsLinear <- AugmentYearDataWithMonthResolution(dsLinear=dsLinear, dateName="Date")

hSpread <- function( scores ) { return( quantile(x=scores, probs=c(.25, .75)) ) }
portfolio <- AnnotateData(
  dsLinear = dsLinear,
  dvName = "BirthRate",
  centerFunction = median,
  spreadFunction = hSpread
)
rm(dsLinear)

polarized <- PolarizeCartesian(
  portfolio$dsLinear, 
  portfolio$dsStageCycle, 
  yName = "BirthRate", 
  stageIDName = "StageID"
)

grid.newpage()
PolarPeriodic(
  dsLinear = polarized$dsObservedPolar, 
  dsStageCyclePolar = polarized$dsStageCyclePolar, 
  yName = "Radius", 
  stageIDName = "StageID", 
  cardinalLabels = c("Jan1", "Apr1", "July1", "Oct1")
)

grid.newpage()
PolarPeriodic(
  dsLinear = polarized$dsObservedPolar, 
  dsStageCyclePolar = polarized$dsStageCyclePolar, 
  yName = "Radius", 
  stageIDName = "StageID", 
  drawPeriodicBand = FALSE
)

grid.newpage()
PolarPeriodic(
  dsLinear = polarized$dsObservedPolar, 
  dsStageCyclePolar = polarized$dsStageCyclePolar, 
  yName = "Radius", 
  stageIDName = "StageID", 
  drawObservedLine = FALSE, 
  cardinalLabels = c("Jan1", "Apr1", "July1", "Oct1")
)



