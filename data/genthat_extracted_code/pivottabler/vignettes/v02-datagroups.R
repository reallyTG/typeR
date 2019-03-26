## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType", onlyCombinationsThatExist=FALSE)
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType", fromData=FALSE, explicitListOfValues=list("DMU", "EMU"))
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType", fromData=FALSE, explicitListOfValues=list("DMU", "EMU"), visualTotals=TRUE)
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC", fromData=FALSE, explicitListOfValues=list(
    "London Midland", "CrossCountry", c("Arriva Trains Wales", "Virgin Trains")))
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC", fromData=FALSE, explicitListOfValues=list(
  "London Midland", "CrossCountry", "Other"=c("Arriva Trains Wales", "Virgin Trains")))
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
# derive the date of each train (from the arrival/dep times),
# then the month of each train from the date of each train
library(dplyr)
library(lubridate)
trains <- mutate(bhmtrains, 
   GbttDate=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
   GbttMonth=make_date(year=year(GbttDate), month=month(GbttDate), day=1))

library(pivottabler)
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("GbttMonth")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
# derive the date of each train (from the arrival/dep times),
# then the month of each train from the date of each train
library(dplyr)
library(lubridate)
trains <- mutate(bhmtrains, 
   GbttDate=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
   GbttMonth=make_date(year=year(GbttDate), month=month(GbttDate), day=1))

library(pivottabler)
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("GbttMonth", dataFormat=list(format="%B %Y"))
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
# derive the date of each train (from the arrival/dep times), then the month of each train from the date of each train
library(dplyr)
library(lubridate)
trains <- mutate(bhmtrains, 
   GbttDate=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
   GbttMonth=make_date(year=year(GbttDate), month=month(GbttDate), day=1))

# define a custom formatting function
formatDate <- function(x) {
  base::format(x, format="%B %Y")
}

library(pivottabler)
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("GbttMonth", dataFormat=formatDate)
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC", dataSortOrder="desc")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC", dataSortOrder="desc")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$sortRowDataGroups(levelNumber=1, orderBy="calculation", sortOrder="desc")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$sortColumnDataGroups(levelNumber=2, orderBy="calculation", sortOrder="desc")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
# the follow line sorts the data based on the totals
pt$sortColumnDataGroups(levelNumber=2, orderBy="calculation", sortOrder="desc")
# the following line resets the sort order back, i.e. removes the sort applied in the line above
pt$sortColumnDataGroups(levelNumber=2, orderBy="value", sortOrder="asc")
pt$renderPivot()

