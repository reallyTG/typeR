## ---- message=FALSE, warning=FALSE, comment="", echo=TRUE, eval=FALSE----
#  pt <- PivotTable$new()
#  pt$addData(bhmtrains)
#  ...

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="NumberOfTrains", caption="Number of Trains",
                     summariseExpression="n()")
pt$defineCalculation(calculationName="MinimumpeedMPH", caption="Minimum Speed (MPH)",
                     summariseExpression="min(SchedSpeedMPH, na.rm=TRUE)")
pt$defineCalculation(calculationName="MaximumSpeedMPH", caption="Maximum Speed (MPH)",
                     summariseExpression="max(SchedSpeedMPH, na.rm=TRUE)")
pt$renderPivot()

