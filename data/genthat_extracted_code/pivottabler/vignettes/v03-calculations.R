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
library(dplyr)
library(lubridate)

# derive some additional data
trains <- mutate(bhmtrains,
   ArrivalDelta=difftime(ActualArrival, GbttArrival, units="mins"),
   ArrivalDelay=ifelse(ArrivalDelta<0, 0, ArrivalDelta))

# create the pivot table
pt <- PivotTable$new()
pt$addData(trains)
pt$addRowDataGroups("TOC", totalCaption="All TOCs")
pt$defineCalculation(calculationName="TotalTrains", caption="Total Trains", 
                     summariseExpression="n()")
pt$defineCalculation(calculationName="MinArrivalDelay", caption="Min Arr. Delay", 
                     summariseExpression="min(ArrivalDelay, na.rm=TRUE)")
pt$defineCalculation(calculationName="MaxArrivalDelay", caption="Max Arr. Delay", 
                     summariseExpression="max(ArrivalDelay, na.rm=TRUE)")
pt$defineCalculation(calculationName="MeanArrivalDelay", caption="Mean Arr. Delay", 
                     summariseExpression="mean(ArrivalDelay, na.rm=TRUE)", format="%.1f")
pt$defineCalculation(calculationName="MedianArrivalDelay", caption="Median Arr. Delay", 
                     summariseExpression="median(ArrivalDelay, na.rm=TRUE)")
pt$defineCalculation(calculationName="IQRArrivalDelay", caption="Delay IQR", 
                     summariseExpression="IQR(ArrivalDelay, na.rm=TRUE)")
pt$defineCalculation(calculationName="SDArrivalDelay", caption="Delay Std. Dev.", 
                     summariseExpression="sd(ArrivalDelay, na.rm=TRUE)", format="%.1f")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
library(dplyr)
library(lubridate)

# derive some additional data
trains <- mutate(bhmtrains,
   ArrivalDelta=difftime(ActualArrival, GbttArrival, units="mins"),
   ArrivalDelay=ifelse(ArrivalDelta<0, 0, ArrivalDelta),
   DelayedByMoreThan5Minutes=ifelse(ArrivalDelay>5,1,0))

# create the pivot table
pt <- PivotTable$new()
pt$addData(trains)
pt$addRowDataGroups("TOC", totalCaption="All TOCs")
pt$defineCalculation(calculationName="DelayedTrains", caption="Trains Arr. 5+ Mins Late", 
                     summariseExpression="sum(DelayedByMoreThan5Minutes, na.rm=TRUE)")
pt$defineCalculation(calculationName="TotalTrains", caption="Total Trains", 
                     summariseExpression="n()")
pt$defineCalculation(calculationName="DelayedPercent", caption="% Trains Arr. 5+ Mins Late", 
                     type="calculation", basedOn=c("DelayedTrains", "TotalTrains"), 
                     format="%.1f %%",
                     calculationExpression="values$DelayedTrains/values$TotalTrains*100")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
library(dplyr)
library(lubridate)

# derive some additional data
trains <- mutate(bhmtrains,
   GbttDateTime=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
   GbttMonth=make_date(year=year(GbttDateTime), month=month(GbttDateTime), day=1),
   ArrivalDelta=difftime(ActualArrival, GbttArrival, units="mins"),
   ArrivalDelay=ifelse(ArrivalDelta<0, 0, ArrivalDelta),
   DelayedByMoreThan5Minutes=ifelse(ArrivalDelay>5,1,0))

# create the pivot table
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("GbttMonth", dataFormat=list(format="%B %Y"))
pt$addRowDataGroups("TOC", totalCaption="All TOCs")
pt$defineCalculation(calculationName="DelayedTrains", visible=FALSE,
                     summariseExpression="sum(DelayedByMoreThan5Minutes, na.rm=TRUE)")
pt$defineCalculation(calculationName="TotalTrains", visible=FALSE,
                     summariseExpression="n()")
pt$defineCalculation(calculationName="DelayedPercent", caption="% Trains Arr. 5+ Mins Late", 
                     type="calculation", basedOn=c("DelayedTrains", "TotalTrains"), 
                     format="%.1f %%",
                     calculationExpression="values$DelayedTrains/values$TotalTrains*100")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="NumberOfTrains", caption="Number of Trains",
                     summariseExpression="n()")
pt$defineCalculation(calculationName="MaximumSpeedMPH", caption="Maximum Speed (MPH)",
                     summariseExpression="max(SchedSpeedMPH, na.rm=TRUE)")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="NumberOfTrains", caption="Number of Trains",
                     summariseExpression="n()")
pt$defineCalculation(calculationName="MaximumSpeedMPH", caption="Maximum Speed (MPH)",
                     summariseExpression="max(SchedSpeedMPH, na.rm=TRUE)")
pt$addRowCalculationGroups()
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$defineCalculation(calculationName="NumberOfTrains", caption="Number of Trains",
                     summariseExpression="n()")
pt$defineCalculation(calculationName="MaximumSpeedMPH", caption="Maximum Speed (MPH)",
                     summariseExpression="max(SchedSpeedMPH, na.rm=TRUE)")
pt$addColumnCalculationGroups()
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$defineCalculation(calculationName="NumberOfTrains", caption="Number of Trains",
                     summariseExpression="n()")
pt$defineCalculation(calculationName="MaximumSpeedMPH", caption="Maximum Speed (MPH)",
                     summariseExpression="max(SchedSpeedMPH, na.rm=TRUE)")
pt$addRowCalculationGroups()
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$renderPivot()

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
                     filters=weekendFilter, visible=FALSE)
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()", visible=FALSE)
pt$defineCalculation(calculationName="WeekendTrainsPercentage",
                     type="calculation", basedOn=c("WeekendTrains", "TotalTrains"),
                     format="%.1f %%",
                     calculationExpression="values$WeekendTrains/values$TotalTrains*100")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
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
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()", noDataValue=0)
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()", noDataCaption="-")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
library(dplyr)

# derive some additional data
trains <- mutate(bhmtrains, 
  ArrivalDelta=difftime(ActualArrival, GbttArrival, units="mins"),
  ArrivalDelay=ifelse(ArrivalDelta<0, 0, ArrivalDelta),
  DelayedByMoreThan5Minutes=ifelse(ArrivalDelay>5,1,0)) %>%
  select(TrainCategory, TOC, DelayedByMoreThan5Minutes) 
# in this example, bhmtraindisruption is joined to bhmtrains
# so that the TrainCategory and TOC columns are present in both
# data frames added to the pivot table
cancellations <- bhmtraindisruption %>%
  inner_join(bhmtrains, by="ServiceId") %>%
  mutate(CancelledInBirmingham=ifelse(LastCancellationLocation=="BHM",1,0)) %>%
  select(TrainCategory, TOC, CancelledInBirmingham)

# create the pivot table
pt <- PivotTable$new()
pt$addData(trains, "trains")
pt$addData(cancellations, "cancellations")
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="DelayedTrains", dataName="trains", 
                     caption="Delayed", 
                     summariseExpression="sum(DelayedByMoreThan5Minutes, na.rm=TRUE)")
pt$defineCalculation(calculationName="CancelledTrains", dataName="cancellations", 
                     caption="Cancelled", 
                     summariseExpression="sum(CancelledInBirmingham, na.rm=TRUE)")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
library(dplyr)
library(lubridate)

# derive some additional data
trains <- mutate(bhmtrains,
   GbttDateTime=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
   GbttDate=make_date(year=year(GbttDateTime), month=month(GbttDateTime), day=day(GbttDateTime)),
   GbttMonth=make_date(year=year(GbttDateTime), month=month(GbttDateTime), day=1),
   ArrivalDelta=difftime(ActualArrival, GbttArrival, units="mins"),
   ArrivalDelay=ifelse(ArrivalDelta<0, 0, ArrivalDelta),
   DelayedByMoreThan5Minutes=ifelse(ArrivalDelay>5,1,0))

# custom calculation function
getWorstSingleDayPerformance <- function(pivotCalculator, netFilters, format, baseValues, cell) {
  # get the data frame
  trains <- pivotCalculator$getDataFrame("trains")
  # apply the TOC and month filters coming from the headers in the pivot table
  filteredTrains <- pivotCalculator$getFilteredDataFrame(trains, netFilters)
  # calculate the percentage of trains more than five minutes late by date
  dateSummary <- filteredTrains %>%
    group_by(GbttDate) %>%
    summarise(DelayedPercent = sum(DelayedByMoreThan5Minutes, na.rm=TRUE) / n() * 100) %>%
    arrange(desc(DelayedPercent))
  # top value
  tv <- dateSummary$DelayedPercent[1]
  # build the return value
  value <- list()
  value$rawValue <- tv
  value$formattedValue <- pivotCalculator$formatValue(tv, format=format)
  return(value)
}

# create the pivot table
pt <- PivotTable$new()
pt$addData(trains, "trains")
pt$addColumnDataGroups("GbttMonth", dataFormat=list(format="%B %Y"))
pt$addRowDataGroups("TOC", totalCaption="All TOCs")
pt$defineCalculation(calculationName="WorstSingleDayDelay", format="%.1f %%",
                     type="function", calculationFunction=getWorstSingleDayPerformance)
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
library(dplyr)
library(lubridate)

# derive some additional data
trains <- mutate(bhmtrains,
   GbttDateTime=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
   GbttDate=make_date(year=year(GbttDateTime), month=month(GbttDateTime), day=day(GbttDateTime)),
   GbttMonth=make_date(year=year(GbttDateTime), month=month(GbttDateTime), day=1),
   ArrivalDelta=difftime(ActualArrival, GbttArrival, units="mins"),
   ArrivalDelay=ifelse(ArrivalDelta<0, 0, ArrivalDelta),
   DelayedByMoreThan5Minutes=ifelse(ArrivalDelay>5,1,0))

# custom calculation function
getWorstSingleDayPerformance <- function(pivotCalculator, netFilters, format, baseValues, cell) {
  # get the data frame
  trains <- pivotCalculator$getDataFrame("trains")
  # apply the TOC and month filters coming from the headers in the pivot table
  filteredTrains <- pivotCalculator$getFilteredDataFrame(trains, netFilters)
  # calculate the percentage of trains more than five minutes late by date
  dateSummary <- filteredTrains %>%
    group_by(GbttDate) %>%
    summarise(DelayedPercent = sum(DelayedByMoreThan5Minutes, na.rm=TRUE) / n() * 100) %>%
    arrange(desc(DelayedPercent))
  # top value
  tv <- dateSummary$DelayedPercent[1]
  date <- dateSummary$GbttDate[1]             #     <<  CODE CHANGE  <<
  # build the return value
  value <- list()
  value$rawValue <- tv
  value$formattedValue <- paste0(format(      #     <<  CODE CHANGE (AND BELOW)  <<
    date, format="%a %d"), ":  ", pivotCalculator$formatValue(tv, format=format))
  return(value)
}

# create the pivot table
pt <- PivotTable$new()
pt$addData(trains, "trains")
pt$addColumnDataGroups("GbttMonth", dataFormat=list(format="%B %Y"))
pt$addRowDataGroups("TOC", totalCaption="All TOCs")
pt$defineCalculation(calculationName="WorstSingleDayDelay", format="%.1f %%",
                     type="function", calculationFunction=getWorstSingleDayPerformance)
pt$renderPivot()

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

# perform the aggregation in R code explicitly
trains <- bhmtrains %>%
  group_by(TrainCategory, TOC) %>%
  summarise(NumberOfTrains=n()) %>%
  ungroup()

# a sample of the aggregated data
head(trains)

# display this pre-calculated data
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", type="value", valueName="NumberOfTrains")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)

# perform the aggregation in R code explicitly
trains <- bhmtrains %>%
  group_by(TrainCategory, TOC) %>%
  summarise(NumberOfTrains=n()) %>%
  ungroup()

# display this pre-calculated data
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("TrainCategory", addTotal=FALSE)   #  <<  *** CODE CHANGE ***  <<
pt$addRowDataGroups("TOC", addTotal=FALSE)                #  <<  *** CODE CHANGE ***  <<
pt$defineCalculation(calculationName="TotalTrains", type="value", valueName="NumberOfTrains")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)

# perform the aggregation in R code explicitly
trains <- bhmtrains %>%
  group_by(TrainCategory, TOC) %>%
  summarise(NumberOfTrains=n()) %>%
  ungroup()

# display this pre-calculated data
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains",  # <<  *** CODE CHANGE (AND BELOW) *** <<
                     type="value", valueName="NumberOfTrains", 
                     summariseExpression="sum(NumberOfTrains)")
pt$renderPivot()

