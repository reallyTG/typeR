## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- PivotStyle$new(pt, "cellHighlight", list("background-color"="#00FF00"))
cells <- pt$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(3, 2)))
cellCount <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, message=FALSE------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- PivotStyle$new(pt, "cellHighlight", list("background-color"="#00FF00"))
cells <- pt$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(3, 2)))
cellCount <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot(includeHeaderValues=TRUE, includeRCFilters=TRUE)

## ---- warning=FALSE, message=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- PivotStyle$new(pt, "cellHighlight", list("background-color"="#00FF00"))
cells <- pt$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(3, 2)))
cellCount <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot(includeHeaderValues=TRUE, includeRCFilters=TRUE, 
               includeCalculationFilters=TRUE, includeWorkingData=TRUE, includeEvaluationFilters=TRUE,
               includeCalculationNames=TRUE, includeRawValue=TRUE, includeTotalInfo=TRUE)

## ---- warning=FALSE, message=FALSE---------------------------------------
library(dplyr)
library(lubridate)
library(pivottabler)

# get the date of each train and whether that date is a weekday or weekend
trains <- bhmtrains %>%
  mutate(GbttDateTime=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
         DayNumber=wday(GbttDateTime),
         WeekdayOrWeekend=ifelse(DayNumber %in% c(1,7), "Weekend", "Weekday"))

# render the pivot table
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC", fromData=FALSE, 
                    explicitListOfValues=list("Arriva Trains Wales"), addTotal=FALSE)
weekendFilter <- PivotFilters$new(pt, variableName="WeekdayOrWeekend", values="Weekend")
pt$defineCalculation(calculationName="WeekendTrains", summariseExpression="n()", 
                     filters=weekendFilter)
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$defineCalculation(calculationName="WeekendTrainsPercentage",
                     type="calculation", basedOn=c("WeekendTrains", "TotalTrains"),
                     format="%.1f %%",
                     calculationExpression="values$WeekendTrains/values$TotalTrains*100")
pt$addRowCalculationGroups() 
pt$renderPivot(includeHeaderValues=TRUE, includeRCFilters=TRUE, 
               includeCalculationFilters=TRUE, includeWorkingData=TRUE, includeEvaluationFilters=TRUE,
               includeCalculationNames=TRUE, includeRawValue=TRUE, includeTotalInfo=TRUE)

