library(otvPlots)


### Name: PrepData
### Title: Prepare an input dataset for plotting
### Aliases: PrepData

### ** Examples

## Use the bankData dataset in this package
data(bankData)
bankData <- PrepData(bankData, dateNm = "date", dateGp = "months", 
                     dateGpBp = "quarters")
## Columns have been assigned a plotting class (nmrcl/ctgrl)
str(bankData) 



