## ---- message=FALSE, warning=FALSE, comment="", echo=TRUE, eval=FALSE----
#  ...
#  pt$addColumnDataGroups("Sale Item")
#  pt$defineCalculation(calculationName="Total Sales",
#                       summariseExpression="sum(`Sale Amount`)")
#  pt$defineCalculation(type="calculation", basedOn=c("Total Sales", "Sale Count"),
#                       format="%.1f", calculationName="Avg Sale Amount",
#                       calculationExpression="values$`Total Sales`/values$`Sale Count`")
#  ...

## ---- message=FALSE, warning=FALSE, comment="", echo=TRUE----------------
someData <- data.frame(Colour=c("Red", "Yellow", "Green", "Blue", "White", "Black"),
                       SomeNumber=c(1, 2, NA, NaN, -Inf, Inf))
library(pivottabler)
pt <- PivotTable$new()
pt$addData(someData)
pt$addRowDataGroups("Colour")
pt$defineCalculation(calculationName="Total", summariseExpression="sum(SomeNumber)")
pt$evaluatePivot()
pt$renderPivot()
pt$renderPivot(exportOptions=list(skipNegInf=TRUE, skipPosInf=TRUE, skipNA=TRUE, skipNaN=TRUE))
pt$renderPivot(exportOptions=list(exportNegInfAs="-Infinity", exportPosInfAs="Infinity",
                                  exportNAAs="Nothing", exportNaNAs="Not a Number"))

