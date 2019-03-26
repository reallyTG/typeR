library(pivottabler)


### Name: PivotTable
### Title: A class that defines a pivot table.
### Aliases: PivotTable
### Keywords: datasets

### ** Examples

# The package vignettes have many more examples of working with the
# PivotTable class.
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains",
summariseExpression="n()")
pt$renderPivot()



