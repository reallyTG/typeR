library(rAmCharts)


### Name: initialize,PeriodSelector-method
### Title: Initializes a PeriodSelector
### Aliases: initialize,PeriodSelector-method periodSelector addPeriod
###   addPeriod,PeriodSelector-method

### ** Examples

new( "PeriodSelector")
periodSelector(fillAlpha = .4, value = 1)
periodSelector(fillAlpha = .4, adjustBorderColor = TRUE, gridThickness = 1)
addPeriod(.Object = periodSelector(), period = "MM", selected = TRUE,
          count = 1, label= "1 month")



