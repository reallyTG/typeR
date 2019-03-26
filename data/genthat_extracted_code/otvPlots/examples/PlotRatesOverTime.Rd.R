library(otvPlots)


### Name: PlotRatesOverTime
### Title: Creates trace plots of categories' proportions over time for a
###   discrete (or binary) variable
### Aliases: PlotRatesOverTime

### ** Examples

data(bankData)
bankData$weight = rpois(nrow(bankData), 5)
bankData <- PrepData(bankData, dateNm = "date", dateGp = "months", 
                     dateGpBp = "quarters", weightNm = "weight")
PlotRatesOverTime(dataFl = bankData, dateGp = "months", weightNm = "weight",
                  myVar = "job", newLevels = NULL, normBy = "time")




