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
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFFF00"))
groups <- pt$findColumnDataGroups(variableNames="TrainCategory")
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFFF00"))
groups <- pt$findColumnDataGroups(variableValues=list("PowerType"=c("DMU", "HST")))
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFFF00"))
groups <- pt$findColumnDataGroups(variableNames="TrainCategory", totals="exclude")
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFFF00"))
groups <- pt$findColumnDataGroups(variableNames="TrainCategory", totals="only")
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFFF00"))
groups <- pt$findColumnDataGroups(
  variableValues=list("TrainCategory"="Ordinary Passenger"), 
  includeDescendantGroup=TRUE)
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFFF00"))
groups <- pt$findColumnDataGroups(
  variableValues=list("TrainCategory"="**"), 
  includeDescendantGroup=TRUE)
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#00FFFF"))
groups <- pt$findColumnDataGroups(matchMode="combinations",
                                  variableNames=c("TrainCategory", "PowerType"))
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#00FFFF"))
groups <- pt$findColumnDataGroups(matchMode="combinations",
  variableValues=list("TrainCategory"="Express Passenger", "PowerType"=c("DMU", "HST")))
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFFF00"))
groups <- pt$findColumnDataGroups(
  variableValues=list("TrainCategory"="Express Passenger", "PowerType"=c("DMU", "HST")))
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#00FFFF"))
groups <- pt$findColumnDataGroups(matchMode="combinations", variableNames="PowerType",
  variableValues=list("TrainCategory"="Express Passenger"))
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- pt$createInlineStyle(declarations=list("background-color"="#00FFFF"))
groups <- pt$findColumnDataGroups(matchMode="combinations", 
  variableValues=list("TrainCategory"="Express Passenger", "PowerType"="**"))
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFCC66"))
cells <- pt$getCells(specifyCellsAsList=TRUE, rowNumbers=c(1, 3))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFCC66"))
cells <- pt$getCells(specifyCellsAsList=TRUE, columnNumbers=2)
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFCC66"))
cells <- pt$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(2, 3)))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
cat("The raw value of the cell is", cells[[1]]$rawValue, "and the formatted value is", cells[[1]]$formattedValue, ".")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFCC66"))
cells <- pt$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(2, 3), c(3, 4), c(5, 7)))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FFCC66"))
cells <- pt$getCells(specifyCellsAsList=TRUE, rowNumbers=2, columnNumbers=4, cellCoordinates=list(c(5, 7)))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#00FF00"))
cells <- pt$getCells(specifyCellsAsList=FALSE, rowNumbers=c(1, 3))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#00FF00"))
cells <- pt$getCells(specifyCellsAsList=FALSE, columnNumbers=2)
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#00FF00"))
cells <- pt$getCells(specifyCellsAsList=FALSE, rowNumbers=2, columnNumbers=3)
lst <- lapply(cells, function(cell) {cell$style <- highlight})
cat("The raw value of the cell is", cells[[1]]$rawValue, "and the formatted value is", cells[[1]]$formattedValue, ".")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#00FF00"))
cells <- pt$getCells(specifyCellsAsList=FALSE, rowNumbers=c(2, 3, 5), columnNumbers=c(3, 4, 7))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#00FF00"))
cells <- pt$getCells(specifyCellsAsList=FALSE, rowNumbers=c(2, NA, 5), columnNumbers=c(NA, 4, 7))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FF00FF"))
cells <- pt$findCells(variableNames="PowerType")
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FF00FF"))
cells <- pt$findCells(variableValues=list("PowerType"=c("DMU", "HST")))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FF00FF"))
cells <- pt$findCells(variableValues=list("PowerType"=c("DMU", "HST"), "TOC"="London Midland"))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FF00FF"))
cells <- pt$findCells(variableNames="PowerType", totals="only")
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FF00FF"))
cells <- pt$findCells(variableValues=list("PowerType"="**"))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FF00FF"))
cells <- pt$findCells(variableValues=list("TrainCategory"="!*", "PowerType"="**"))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- pt$createInlineStyle(declarations=list("background-color"="#FF00FF"))
cells <- pt$findCells(variableValues=list("TrainCategory"="**", "PowerType"="**", "TOC"="**"))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
redStyle <- pt$createInlineStyle(declarations=list("background-color"="#FFC7CE", "color"="#9C0006"))
cells <- pt$findCells(minValue=30000, maxValue=50000, includeNull=FALSE, includeNA=FALSE)
lst <- lapply(cells, function(cell) {cell$style <- redStyle})
pt$renderPivot()

## ---- warning=FALSE, message=FALSE---------------------------------------
# calculate arrival delay information
library(dplyr)
library(lubridate)
library(pivottabler)

stations <- mutate(trainstations, CrsCodeChr=as.character(CrsCode))

topOrigins <- bhmtrains %>%
  mutate(OriginChr=as.character(Origin)) %>%
  filter(Origin != "BHM") %>%
  group_by(OriginChr) %>%
  summarise(TotalTrains = n()) %>%
  ungroup() %>%
  top_n(20, TotalTrains)

trains <- bhmtrains %>%
  mutate(OriginChr=as.character(Origin), DestinationChr=as.character(Destination)) %>%
  inner_join(topOrigins, by=c("OriginChr"="OriginChr")) %>%
  inner_join(stations, by=c("OriginChr"="CrsCodeChr")) %>%
  inner_join(stations, by=c("DestinationChr"="CrsCodeChr")) %>%
  select(TOC, TrainCategory, PowerType, Origin=StationName.x, 
         GbttArrival, ActualArrival, GbttDeparture, ActualDeparture) %>%
  mutate(GbttDateTime=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
         GbttHourOfDay=hour(GbttDateTime),
         ArrivalDeltaMins=difftime(ActualArrival, GbttArrival, units="mins"),
         ArrivalDelayMins=ifelse(ArrivalDeltaMins<0, 0, ArrivalDeltaMins)) %>%
  filter(GbttHourOfDay %in% c(5, 6, 7, 8, 9, 10)) %>%
  select(TOC, TrainCategory, PowerType, Origin, GbttHourOfDay, ArrivalDelayMins)

# create the pivot table
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("GbttHourOfDay")
pt$addRowDataGroups("Origin")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()", visible=FALSE)
pt$defineCalculation(calculationName="TotalDelayMins", 
                     summariseExpression="sum(ArrivalDelayMins, na.rm=TRUE)", visible=FALSE)
pt$defineCalculation(calculationName="AvgDelayMins", type="calculation", 
                     basedOn=c("TotalDelayMins", "TotalTrains"),
                     calculationExpression="values$TotalDelayMins/values$TotalTrains",
                     format="%.1f")
pt$evaluatePivot()

# define three cell styles
greenStyle <- pt$createInlineStyle(declarations=list("background-color"="#C6EFCE", "color"="#006100"))
yellowStyle <- pt$createInlineStyle(declarations=list("background-color"="#FFEB9C", "color"="#9C5700"))
redStyle <- pt$createInlineStyle(declarations=list("background-color"="#FFC7CE", "color"="#9C0006"))

# apply the green style for an average arrival delay of between 0 and 2 minutes
cells <- pt$findCells(minValue=0, maxValue=2, includeNull=FALSE, includeNA=FALSE)
lst <- lapply(cells, function(cell) {cell$style <- greenStyle})
# apply the yellow style for an average arrival delay of between 2 and 4 minutes
cells <- pt$findCells(minValue=2, maxValue=4, includeNull=FALSE, includeNA=FALSE)
lst <- lapply(cells, function(cell) {cell$style <- yellowStyle})
# apply the red style for an average arrival delay of 4 minutes or greater
cells <- pt$findCells(minValue=4, includeNull=FALSE, includeNA=FALSE)
lst <- lapply(cells, function(cell) {cell$style <- redStyle})
pt$renderPivot()

## ---- warning=FALSE, message=FALSE---------------------------------------
# calculate arrival delay information
library(dplyr)
library(lubridate)
library(pivottabler)

stations <- mutate(trainstations, CrsCodeChr=as.character(CrsCode))

topOrigins <- bhmtrains %>%
  mutate(OriginChr=as.character(Origin)) %>%
  filter(Origin != "BHM") %>%
  group_by(OriginChr) %>%
  summarise(TotalTrains = n()) %>%
  ungroup() %>%
  top_n(20, TotalTrains)

trains <- bhmtrains %>%
  mutate(OriginChr=as.character(Origin), DestinationChr=as.character(Destination)) %>%
  inner_join(topOrigins, by=c("OriginChr"="OriginChr")) %>%
  inner_join(stations, by=c("OriginChr"="CrsCodeChr")) %>%
  inner_join(stations, by=c("DestinationChr"="CrsCodeChr")) %>%
  select(TOC, TrainCategory, PowerType, Origin=StationName.x, 
         GbttArrival, ActualArrival, GbttDeparture, ActualDeparture) %>%
  mutate(GbttDateTime=if_else(is.na(GbttArrival), GbttDeparture, GbttArrival),
         GbttHourOfDay=hour(GbttDateTime),
         ArrivalDeltaMins=difftime(ActualArrival, GbttArrival, units="mins"),
         ArrivalDelayMins=ifelse(ArrivalDeltaMins<0, 0, ArrivalDeltaMins)) %>%
  filter(GbttHourOfDay %in% c(5, 6, 7, 8, 9, 10)) %>%
  select(TOC, TrainCategory, PowerType, Origin, GbttHourOfDay, ArrivalDelayMins)

# create the pivot table
library(pivottabler)
pt <- PivotTable$new()
pt$addData(trains)
pt$addColumnDataGroups("GbttHourOfDay")
pt$addRowDataGroups("Origin")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()", visible=FALSE)
pt$defineCalculation(calculationName="TotalDelayMins", 
                     summariseExpression="sum(ArrivalDelayMins, na.rm=TRUE)", visible=FALSE)
pt$defineCalculation(calculationName="AvgDelayMins", type="calculation", 
                     basedOn=c("TotalDelayMins", "TotalTrains"),
                     calculationExpression="values$TotalDelayMins/values$TotalTrains",
                     format="%.1f")
pt$evaluatePivot()

# colour scale helper functions
scaleNumber <- function(n1, n2, vMin, vMax, value) {
  if(n1==n2) return(n1)
  v <- value
  if(v < vMin) v <- vMin
  if(v > vMax) v <- vMax
  if(n1<n2) {
    return(n1+((v-vMin)/(vMax-vMin)*(n2-n1)))
  }
  else {
    return(n1-((v-vMin)/(vMax-vMin)*(n1-n2)))
  }
}
scale2Colours <- function(clr1, clr2, vMin, vMax, value) {
  r <- round(scaleNumber(clr1$r, clr2$r, vMin, vMax, value))
  g <- round(scaleNumber(clr1$g, clr2$g, vMin, vMax, value))
  b <- round(scaleNumber(clr1$b, clr2$b, vMin, vMax, value))
  return(paste0("#",format(as.hexmode(r), width=2), format(as.hexmode(g), width=2), format(as.hexmode(b), width=2)))
}
scale3Colours <- function(clr1, clr2, clr3, vMin, vMid, vMax, value) {
  if(value <= vMid) return(scale2Colours(clr1, clr2, vMin, vMid, value))
  else return(scale2Colours(clr2, clr3, vMid, vMax, value))
}
hexToClr <- function(hexclr) {
  clr <- list()
  clr$r <- strtoi(paste0("0x", substr(hexclr, 2, 3)))
  clr$g <- strtoi(paste0("0x", substr(hexclr, 4, 5)))
  clr$b <- strtoi(paste0("0x", substr(hexclr, 6, 7)))
  return(clr)
}

# colour constants
textClrGreen <- hexToClr("#006100")
textClrYellow <- hexToClr("#9C5700")
textClrRed <- hexToClr("#9C0006")
backClrGreen <- hexToClr("#C6EFCE")
backClrYellow <- hexToClr("#FFEB9C")
backClrRed <- hexToClr("#FFC7CE")

# specify some conditional formatting, calculating the appropriate text colour and back colour for each cell.
cells <- pt$findCells(includeNull=FALSE, includeNA=FALSE)
for(i in 1:length(cells)) {
  cell <- cells[[i]]
  value <- cell$rawValue
  textClr <- scale3Colours(textClrGreen, textClrYellow, textClrRed, 0.5, 2, 4, value)
  backClr <- scale3Colours(backClrGreen, backClrYellow, backClrRed, 0.5, 2, 4, value)
  cell$style <- pt$createInlineStyle(declarations=list("background-color"=backClr, "color"=textClr))
}
pt$renderPivot()

