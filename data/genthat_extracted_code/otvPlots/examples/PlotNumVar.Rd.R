library(otvPlots)


### Name: PlotNumVar
### Title: Create plots and summary statistics for a numerical variable
### Aliases: PlotNumVar

### ** Examples

data(bankData)
bankData <- PrepData(bankData, dateNm = "date", dateGp = "months", 
                    dateGpBp = "years")
plot(PlotNumVar("balance", bankData, NULL, "months", "years", 
                 skewOpt = NULL, kSample = NULL)$p)



