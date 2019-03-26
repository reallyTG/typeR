library(Wats)


### Name: CartesianRolling
### Title: Linear Plot with Rolling Summaries
### Aliases: CartesianRolling
### Keywords: Cartesian

### ** Examples

library(Wats) #Load the package
changeMonth <- base::as.Date("1996-02-15")
dsLinear <- CountyMonthBirthRate2005Version
dsLinear <- dsLinear[dsLinear$CountyName=="oklahoma", ]
dsLinear <- AugmentYearDataWithMonthResolution(dsLinear=dsLinear, dateName="Date")
hSpread <- function( scores ) { return( quantile(x=scores, probs=c(.25, .75)) ) }
portfolio <- AnnotateData(
    dsLinear, 
    dvName = "BirthRate",
    centerFunction = median, 
    spreadFunction = hSpread
)

CartesianRolling(
    portfolio$dsLinear,
    xName = "Date", 
    yName = "BirthRate",
    stageIDName = "StageID", 
    changePoints = changeMonth, 
    changePointLabels = "Bombing Effect"
)



