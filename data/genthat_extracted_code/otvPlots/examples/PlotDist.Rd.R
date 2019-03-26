library(otvPlots)


### Name: PlotDist
### Title: Side-by-side box plots, for a numerical variable, grouped by
###   'dateGpBp'
### Aliases: PlotDist

### ** Examples

data(bankData)
bankData <- PrepData(bankData, dateNm = "date", dateGp = "months", 
                     dateGpBp = "quarters")
PlotDist(dataFl = bankData, myVar = "balance", dateGpBp = "quarters")
## The following attempt to log transform will fail due to negative values,
## and the untransformed version will be returned
PlotDist(dataFl = bankData, myVar = "balance", dateGpBp = "quarters", 
         skewOpt = 3)
## This attempt should succeed, as the skew exceeds 3 and there are no 
## negative values
PlotDist(dataFl = bankData, myVar = "duration", dateGpBp = "quarters",
         skewOpt = 3)



