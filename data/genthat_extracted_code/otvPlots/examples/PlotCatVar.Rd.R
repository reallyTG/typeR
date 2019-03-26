library(otvPlots)


### Name: PlotCatVar
### Title: Create plots and summary statistics for a categorical variable
### Aliases: PlotCatVar

### ** Examples

data(bankData)
bankData <- PrepData(bankData, dateNm = "date", dateGp = "months", 
                    dateGpBp = "quarters", weightNm = NULL)
# Single histogram is plotted for job type since there are 12 categories
plot(PlotCatVar(myVar = "job", dataFl = bankData, weightNm =  NULL, 
                     dateNm = "date", dateGp = "months")$p)
                     
plot(PlotCatVar(myVar = "job", dataFl = bankData, weightNm = NULL, 
                     dateNm = "date", dateGp = "months", kCategories = 12)$p)


## Binary data is treated as categorical,  and only the less frequent 
## category is plotted over time.
plot(PlotCatVar(myVar = "default", dataFl = bankData, weightNm = NULL, 
                     dateNm = "date", dateGp = "months")$p)



