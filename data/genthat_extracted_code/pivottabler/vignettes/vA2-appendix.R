## ---- message=FALSE, warning=FALSE---------------------------------------

library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot(includeWorkingData=TRUE)

## ---- message=FALSE, warning=FALSE---------------------------------------
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
pt$addRowDataGroups("TOC")
weekendFilter <- PivotFilters$new(pt, variableName="WeekdayOrWeekend", values="Weekend")
pt$defineCalculation(calculationName="WeekendTrains", summariseExpression="n()", 
                     filters=weekendFilter, noDataValue=0, 
                     caption="Weekend Trains")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()", 
                     noDataValue=0, caption="Total Trains")
pt$defineCalculation(calculationName="WeekendTrainsPercentage",
   type="calculation", basedOn=c("WeekendTrains", "TotalTrains"),
   format="%.1f %%", caption="% at Weekend",
   calculationExpression="ifelse(values$TotalTrains>0, values$WeekendTrains/values$TotalTrains*100, NA)")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", 
                     caption="Count", visible=FALSE)
filterOverrides <- PivotFilterOverrides$new(pt, keepOnlyFiltersFor="TOC")
pt$defineCalculation(calculationName="TOCTotalTrains", filters=filterOverrides, 
                     summariseExpression="n()", caption="TOC Total", visible=FALSE)
pt$defineCalculation(calculationName="PercentageOfTOCTrains", type="calculation", 
                     basedOn=c("CountTrains", "TOCTotalTrains"),
                     calculationExpression="values$CountTrains/values$TOCTotalTrains*100", 
                     format="%.1f %%", caption="% of TOC")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", 
                     caption="Count")
filterOverrides <- PivotFilterOverrides$new(pt, keepOnlyFiltersFor="TOC")
pt$defineCalculation(calculationName="TOCTotalTrains", filters=filterOverrides, 
                     summariseExpression="n()", caption="TOC Total")
pt$defineCalculation(calculationName="PercentageOfTOCTrains", type="calculation", 
                     basedOn=c("CountTrains", "TOCTotalTrains"),
                     calculationExpression="values$CountTrains/values$TOCTotalTrains*100", 
                     format="%.1f %%", caption="% of TOC")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", 
                     caption="Count")
filterOverrides <- PivotFilterOverrides$new(pt, keepOnlyFiltersFor="TOC")
pt$defineCalculation(calculationName="TOCTotalTrains", filters=filterOverrides, 
                     summariseExpression="n()", caption="TOC Total")
pt$renderPivot(includeWorkingData=TRUE)

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", caption="Count", visible=FALSE)
filterOverrides <- PivotFilterOverrides$new(pt, removeAllFilters=TRUE)
pt$defineCalculation(calculationName="GrandTotalTrains", filters=filterOverrides, summariseExpression="n()", caption="Grand Total", visible=FALSE)
pt$defineCalculation(calculationName="PercentageOfAllTrains", type="calculation", basedOn=c("CountTrains", "GrandTotalTrains"),
                     calculationExpression="values$CountTrains/values$GrandTotalTrains*100", format="%.1f %%", caption="% of All")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", caption="Count")
filterOverrides <- PivotFilterOverrides$new(pt, removeAllFilters=TRUE)
pt$defineCalculation(calculationName="GrandTotalTrains", filters=filterOverrides, 
                     summariseExpression="n()", caption="Grand Total")
pt$defineCalculation(calculationName="PercentageOfAllTrains", type="calculation", 
                     basedOn=c("CountTrains", "GrandTotalTrains"),
                     calculationExpression="values$CountTrains/values$GrandTotalTrains*100", 
                     format="%.1f %%", caption="% of All")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", caption="Count", visible=FALSE)
filterOverrides <- PivotFilterOverrides$new(pt, removeAllFilters=TRUE)
filterOverrides$add(variableName="TrainCategory", values="Express Passenger", action="replace")
filterOverrides$add(variableName="TOC", values="CrossCountry", action="replace")
pt$defineCalculation(calculationName="CrossCountryExpress", filters=filterOverrides, summariseExpression="n()", caption="CrossCountry Express Trains", visible=FALSE)
pt$defineCalculation(calculationName="MultipleOfCCExpressTrains", type="calculation", basedOn=c("CountTrains", "CrossCountryExpress"),
                     calculationExpression="values$CountTrains/values$CrossCountryExpress", format="%.2f", caption="Multiple of CC Express")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", caption="Count")
filterOverrides <- PivotFilterOverrides$new(pt, removeAllFilters=TRUE)
filterOverrides$add(variableName="TrainCategory", values="Express Passenger", action="replace")
filterOverrides$add(variableName="TOC", values="CrossCountry", action="replace")
pt$defineCalculation(calculationName="CrossCountryExpress", filters=filterOverrides, 
                     summariseExpression="n()", caption="CrossCountry Express Trains")
pt$defineCalculation(calculationName="MultipleOfCCExpressTrains", type="calculation", 
                     basedOn=c("CountTrains", "CrossCountryExpress"),
                     calculationExpression="values$CountTrains/values$CrossCountryExpress", 
                     format="%.2f", caption="Multiple of CC Express")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
filterDMU <- PivotFilter$new(pt, variableName="PowerType", values="DMU")
filterOverrides <- PivotFilterOverrides$new(pt, filter=filterDMU, action="intersect")
pt$defineCalculation(calculationName="CountDMU", filters=filterOverrides, summariseExpression="n()", caption="DMU", visible=FALSE)
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", caption="Count", visible=FALSE)
pt$defineCalculation(calculationName="PercentageDMU", type="calculation", basedOn=c("CountTrains", "CountDMU"),
                     calculationExpression="values$CountDMU/values$CountTrains*100", format="%.1f %%", caption="% DMU")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
filterDMU <- PivotFilter$new(pt, variableName="PowerType", values="DMU")
filterOverrides <- PivotFilterOverrides$new(pt, filter=filterDMU, action="intersect")
pt$defineCalculation(calculationName="CountDMU", filters=filterOverrides, 
                     summariseExpression="n()", caption="DMU")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", caption="Count")
pt$defineCalculation(calculationName="PercentageDMU", type="calculation", 
                     basedOn=c("CountTrains", "CountDMU"),
                     calculationExpression="values$CountDMU/values$CountTrains*100", 
                     format="%.1f %%", caption="% DMU")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
filterTOC <- PivotFilter$new(pt, variableName="TOC", values="London Midland")
filterOverrides <- PivotFilterOverrides$new(pt, filter=filterTOC, action="intersect")
pt$defineCalculation(calculationName="CountLM", filters=filterOverrides, summariseExpression="n()", caption="Test Count")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", caption="Count")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
filterTOC <- PivotFilter$new(pt, variableName="TOC", values="London Midland")
filterOverrides <- PivotFilterOverrides$new(pt, filter=filterTOC, action="replace")
pt$defineCalculation(calculationName="CountLM", filters=filterOverrides, summariseExpression="n()", caption="Test Count")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", caption="Count")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
filterTOC <- PivotFilter$new(pt, variableName="TOC", values="London Midland")
filterOverrides <- PivotFilterOverrides$new(pt, filter=filterTOC, action="union")
pt$defineCalculation(calculationName="CountLM", filters=filterOverrides, summariseExpression="n()", caption="Test Count")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", caption="Count")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(dplyr)
trains <- bhmtrains %>%
  mutate(GbttDateTime=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
         GbttDate=as.Date(GbttDateTime))
januaryDates <- seq(as.Date("2017-01-01"), as.Date("2017-01-07"), by="days")

# comparison to yesterday
# date filter function to return yesterday
getYesterdayDateFilter <- function(pt, filters, cell) {
  # get the date filter
  filter <- filters$getFilter("GbttDate")
  if(is.null(filter)||(filter$type=="ALL")||(length(filter$values)>1)) {
    # there is no filter on GbttDate in this cell
    # i.e. we are in one of the total cells that covers all dates,
    # so the concept of yesterday has no meaning, so block all dates
    newFilter <- PivotFilter$new(pt, variableName="GbttDate", type="NONE")
    filters$setFilter(newFilter, action="replace")
  }
  else {
    # get the date value and subtract one day
    date <- filter$values
    date <- date - 1
    filter$values <- date
  }
}
# build the pivot
library(pivottabler)
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("GbttDate", fromData=FALSE, 
                    explicitListOfValues=as.list(januaryDates), visualTotals=TRUE)
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", 
                     caption="Current Day Count")
filterOverrides <- PivotFilterOverrides$new(pt, overrideFunction=getYesterdayDateFilter)
pt$defineCalculation(calculationName="CountPreviousDayTrains", filters=filterOverrides, 
                     summariseExpression="n()", caption="Previous Day Count")
pt$defineCalculation(calculationName="Daily Change", type="calculation", 
                     basedOn=c("CountTrains", "CountPreviousDayTrains"),
                     calculationExpression="values$CountTrains-values$CountPreviousDayTrains", 
                     caption="Daily Change")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(dplyr)
trains <- bhmtrains %>%
  mutate(GbttDateTime=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
         GbttDate=as.Date(GbttDateTime))
januaryDates <- seq(as.Date("2017-01-01"), as.Date("2017-01-07"), by="days")

# three-day rolling average
# date filter function to a three day range of dates
getThreeDayFilter <- function(pt, filters, cell) {
  # get the date filter
  filter <- filters$getFilter("GbttDate")
  if(is.null(filter)||(filter$type=="ALL")||(length(filter$values)>1)) {
    # there is no filter on GbttDate in this cell
    # i.e. we are in one of the total cells that covers all dates,
    # so the concept of previous/next day has no meaning, so block all dates
    newFilter <- PivotFilter$new(pt, variableName="GbttDate", type="NONE")
    filters$setFilter(newFilter, action="replace")
  }
  else {
    # get the date value and create three day filter
    date <- filter$values
    newDates <- seq(date-1, date+1, by="days")
    filter$values <- newDates
  }
}
# build the pivot
library(pivottabler)
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("GbttDate", fromData=FALSE, 
                    explicitListOfValues=as.list(januaryDates), visualTotals=TRUE)
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", 
                     caption="Current Day Count")
filterOverrides <- PivotFilterOverrides$new(pt, overrideFunction=getThreeDayFilter)
pt$defineCalculation(calculationName="ThreeDayCount", filters=filterOverrides, 
                     summariseExpression="n()", caption="Three Day Total")
pt$defineCalculation(calculationName="ThreeDayAverage", type="calculation", 
                     basedOn="ThreeDayCount",
                     calculationExpression="values$ThreeDayCount/3", 
                     format="%.1f", caption="Three Day Rolling Average")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(dplyr)
library(dplyr)

# here the trains data frame does not contain data for 31st Dec and 8th Jan,
# so the rolling average for 1st Jan and 7th Jan will be incomplete.
trains <- bhmtrains %>%
  mutate(GbttDateTime=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
         GbttDate=as.Date(GbttDateTime)) %>%
  filter((as.Date("2017-01-01") <= GbttDate) & (GbttDate <= as.Date("2017-01-07")))

# three-day rolling average
# date filter function to a three day range of dates
getThreeDayFilter <- function(pt, filters, cell) {
  # get the date filter
  filter <- filters$getFilter("GbttDate")
  if(is.null(filter)||(filter$type=="ALL")||(length(filter$values)>1)) {
    # there is no filter on GbttDate in this cell
    # i.e. we are in one of the total cells that covers all dates,
    # so the concept of previous/next day has no meaning, so block all dates
    newFilter <- PivotFilter$new(pt, variableName="GbttDate", type="NONE")
    filters$setFilter(newFilter, action="replace")
  }
  else {
    # get the date value and create three day filter
    date <- filter$values
    newDates <- seq(date-1, date+1, by="days")
    filter$values <- newDates
  }
}
# build the pivot
library(pivottabler)
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("GbttDate")
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", 
                     caption="Current Day Count")
filterOverrides <- PivotFilterOverrides$new(pt, overrideFunction=getThreeDayFilter)
pt$defineCalculation(calculationName="DaysWithDataCount", filters=filterOverrides, 
                     summariseExpression="n_distinct(GbttDate)", caption="Days With Data")
pt$defineCalculation(calculationName="ThreeDayCount", filters=filterOverrides, 
                     summariseExpression="n()", caption="Three Day Total")
pt$defineCalculation(calculationName="ThreeDayAverage", type="calculation", 
     basedOn=c("DaysWithDataCount", "ThreeDayCount"),
     calculationExpression="ifelse(values$DaysWithDataCount==3, values$ThreeDayCount/3, NA)", 
     format="%.1f", caption="Three Day Rolling Average")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(dplyr)
trains <- bhmtrains %>%
  mutate(GbttDateTime=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
         GbttDate=as.Date(GbttDateTime)) %>%
  filter((as.Date("2017-01-01") <= GbttDate)&(GbttDate <= as.Date("2017-01-07")))
januaryDates <- seq(as.Date("2017-01-01"), as.Date("2017-01-07"), by="days")

# date filter function to all dates since 1st jan
getCumulativeFilter <- function(pt, filters, cell) {
  # get the date filter
  filter <- filters$getFilter("GbttDate")
  if(is.null(filter)||(filter$type=="ALL")||(length(filter$values)>1)) {
    # there is no filter on GbttDate in this cell
    # i.e. we are in one of the total cells that covers all dates,
    # can allow this to just be the total
  }
  else {
    # get the date value and modify the filter
    date <- filter$values
    newDates <- seq(as.Date("2017-01-01"), date, by="days")
    filter$values <- newDates
  }
}
# build the pivot
library(pivottabler)
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("GbttDate", fromData=FALSE, 
                    explicitListOfValues=as.list(januaryDates))
pt$defineCalculation(calculationName="CountTrains", summariseExpression="n()", 
                     caption="Current Day Count")
filterOverrides <- PivotFilterOverrides$new(pt, overrideFunction=getCumulativeFilter)
pt$defineCalculation(calculationName="CumulativeCount", filters=filterOverrides, 
                     summariseExpression="n()", caption="Cumulative Count")
pt$renderPivot()

