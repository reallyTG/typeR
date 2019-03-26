library(Wats)


### Name: AnnotateData
### Title: Finds midpoints and bands for the within and between cycles.
### Aliases: AnnotateData

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

head(portfolio$dsStageCycle)
head(portfolio$dsLinear)
head(portfolio$dsPeriodic)



