library(otvPlots)


### Name: OrderByR2
### Title: Create numerical variable ranking using R2 between date to and
###   variable
### Aliases: OrderByR2

### ** Examples

data(bankData)
bankData <- PrepData(bankData, dateNm = "date", dateGp = "months", 
                     dateGpBp = "quarters")
OrderByR2(bankData, dateNm = "date")



