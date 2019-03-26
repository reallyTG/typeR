## ---- message=FALSE, warning=FALSE, eval=FALSE---------------------------
#  library(pivottabler)
#  pt <- PivotTable$new()
#  pt$addData(bhmtrains)
#  pt$addColumnDataGroups("TrainCategory")
#  pt$addColumnDataGroups("PowerType")
#  pt$addRowDataGroups("TOC")
#  pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
#  pt$evaluatePivot()
#  
#  library(openxlsx)
#  wb <- createWorkbook(creator = Sys.getenv("USERNAME"))
#  addWorksheet(wb, "Data")
#  pt$writeToExcelWorksheet(wb=wb, wsName="Data",
#                           topRowNumber=1, leftMostColumnNumber=1, applyStyles=FALSE)
#  saveWorkbook(wb, file="C:\\test.xlsx", overwrite = TRUE)

## ---- message=FALSE, warning=FALSE, eval=FALSE---------------------------
#  library(pivottabler)
#  pt <- PivotTable$new()
#  pt$addData(bhmtrains)
#  pt$addColumnDataGroups("TrainCategory")
#  pt$addColumnDataGroups("PowerType")
#  pt$addRowDataGroups("TOC")
#  pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
#  pt$evaluatePivot()
#  
#  library(openxlsx)
#  wb <- createWorkbook(creator = Sys.getenv("USERNAME"))
#  addWorksheet(wb, "Data")
#  pt$writeToExcelWorksheet(wb=wb, wsName="Data",
#                           topRowNumber=1, leftMostColumnNumber=1,
#                           applyStyles=TRUE, mapStylesFromCSS=TRUE)
#  saveWorkbook(wb, file="C:\\test.xlsx", overwrite = TRUE)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
library(dplyr)
library(lubridate)

# derive some additional data
trains <- mutate(bhmtrains,
   ArrivalDelta=difftime(ActualArrival, GbttArrival, units="mins"),
   ArrivalDelay=ifelse(ArrivalDelta<0, 0, ArrivalDelta))

# create the pivot table
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC", totalCaption="All TOCs")
pt$defineCalculation(calculationName="MeanArrivalDelay", caption="Mean Arr. Delay", 
                     summariseExpression="mean(ArrivalDelay, na.rm=TRUE)", format="%.1f")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, eval=FALSE---------------------------
#  library(pivottabler)
#  library(dplyr)
#  library(lubridate)
#  
#  # derive some additional data
#  trains <- mutate(bhmtrains,
#     ArrivalDelta=difftime(ActualArrival, GbttArrival, units="mins"),
#     ArrivalDelay=ifelse(ArrivalDelta<0, 0, ArrivalDelta))
#  
#  # create the pivot table
#  pt <- PivotTable$new()
#  pt$addData(trains)
#  pt$addColumnDataGroups("TrainCategory")
#  pt$addColumnDataGroups("PowerType")
#  pt$addRowDataGroups("TOC", totalCaption="All TOCs")
#  pt$defineCalculation(calculationName="MeanArrivalDelay", caption="Mean Arr. Delay",
#                       summariseExpression="mean(ArrivalDelay, na.rm=TRUE)", format="%.1f")
#  pt$evaluatePivot()
#  
#  library(openxlsx)
#  wb <- createWorkbook(creator = Sys.getenv("USERNAME"))
#  addWorksheet(wb, "Data")
#  pt$writeToExcelWorksheet(wb=wb, wsName="Data",
#                           topRowNumber=1, leftMostColumnNumber=1,
#                           outputValuesAs="rawValue",
#                           applyStyles=TRUE, mapStylesFromCSS=TRUE)
#  saveWorkbook(wb, file="C:\\test.xlsx", overwrite = TRUE)

## ---- message=FALSE, warning=FALSE, eval=FALSE---------------------------
#  library(pivottabler)
#  library(dplyr)
#  library(lubridate)
#  
#  # derive some additional data
#  trains <- mutate(bhmtrains,
#     ArrivalDelta=difftime(ActualArrival, GbttArrival, units="mins"),
#     ArrivalDelay=ifelse(ArrivalDelta<0, 0, ArrivalDelta))
#  
#  # create the pivot table
#  pt <- PivotTable$new()
#  pt$addData(trains)
#  pt$addColumnDataGroups("TrainCategory")
#  pt$addColumnDataGroups("PowerType")
#  pt$addRowDataGroups("TOC", totalCaption="All TOCs")
#  pt$defineCalculation(calculationName="MeanArrivalDelay", caption="Mean Arr. Delay",
#                       summariseExpression="mean(ArrivalDelay, na.rm=TRUE)", format="%.1f",
#                       cellStyleDeclarations=list("xl-value-format"="##0.0"))
#  pt$evaluatePivot()
#  
#  library(openxlsx)
#  wb <- createWorkbook(creator = Sys.getenv("USERNAME"))
#  addWorksheet(wb, "Data")
#  pt$writeToExcelWorksheet(wb=wb, wsName="Data",
#                           topRowNumber=1, leftMostColumnNumber=1,
#                           outputValuesAs="rawValue",
#                           applyStyles=TRUE, mapStylesFromCSS=TRUE)
#  saveWorkbook(wb, file="C:\\test.xlsx", overwrite = TRUE)

