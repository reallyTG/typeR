library(otvPlots)


### Name: PlotVar
### Title: Create over time variable plots and summary statitsics for one
###   variable
### Aliases: PlotVar

### ** Examples

data(bankData)
bankData <- PrepData(bankData, dateNm = "date", dateGp = "months", 
                     dateGpBp = "quarters")
data(bankLabels)
bankLabels <- PrepLabels(bankLabels)

## PlotVar will treat numerical and categorical data differently. 
## Binary data is always treated as categorical.
plot(PlotVar(bankData, myVar = "duration", weightNm = NULL, dateNm = "date", 
     dateGp = "months", dateGpBp =  "quarters", labelFl = bankLabels)$p)
plot(PlotVar(bankData, myVar = "job", weightNm = NULL, dateNm = "date", 
     dateGp = "months", dateGpBp =  "quarters", labelFl = bankLabels)$p)
plot(PlotVar(bankData, myVar = "loan", weightNm = NULL, dateNm = "date", 
     dateGp = "months", dateGpBp =  "quarters", labelFl = bankLabels)$p)




