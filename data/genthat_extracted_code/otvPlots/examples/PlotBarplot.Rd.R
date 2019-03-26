library(otvPlots)


### Name: PlotBarplot
### Title: Creates a bar plot for a discrete (or binary) variable
### Aliases: PlotBarplot

### ** Examples

data(bankData)
bankData = PrepData(bankData, dateNm = "date", dateGp = "months", 
                    dateGpBp = "quarters", weightNm = NULL)
PlotBarplot(bankData, "job")

## NA will be included as a category if any NA are present
bankData[sample.int(.N)[1:1000], education := NA]
PlotBarplot(bankData, "education")



