library(Wats)


### Name: PolarizeCartesian
### Title: Manipulate Cartesian data to use in the WATS polar plot
### Aliases: PolarizeCartesian
### Keywords: polar

### ** Examples

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
  dsLinear = portfolio$dsLinear, 
  dsStageCycle = portfolio$dsStageCycle, 
  yName = "BirthRate", 
  stageIDName = "StageID"
)

library(ggplot2)
ggplot(polarized$dsStageCyclePolar, aes(color=factor(StageID))) + 
  geom_path(aes(x=PolarLowerX, y=PolarLowerY), linetype=2) +
  geom_path(aes(x=PolarCenterX, y=PolarCenterY), size=2) +
  geom_path(aes(x=PolarUpperX, y=PolarUpperY), linetype=2) +
  geom_path(aes(x=ObservedX, y=ObservedY), data=polarized$dsObservedPolar) +
  coord_fixed(ratio=1) +
  guides(color=FALSE)



