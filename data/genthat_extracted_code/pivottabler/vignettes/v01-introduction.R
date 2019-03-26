## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
# arguments:  qhpvt(dataFrame, rows, columns, calculations, ...)
qhpvt(bhmtrains, "TOC", "TrainCategory", "n()") # TOC = Train Operating Company 

## ---- message=FALSE, echo=FALSE------------------------------------------
library(pivottabler)
renderBasicTable(t(bhmtrains[1:4,]),rowNamesAsHeader=TRUE)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
# produces no pivot table
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
# specify the column headings
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")   #    << **** LINE ADDED **** <<
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
# specify the row headings
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")                #    << **** LINE ADDED **** <<
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
# specifying a calculation
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")                #     **** LINE BELOW ADDED ****
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, comment=""---------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
pt

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")    #    << **** CODE CHANGE **** <<
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType", expandExistingTotals=TRUE) # << ** CODE CHANGE ** <<
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$addRowDataGroups("PowerType")    #    << **** CODE CHANGE **** <<
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$addRowDataGroups("PowerType")
pt$addRowDataGroups("SchedSpeedMPH")    #    << **** CODE CHANGE **** <<
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC", totalCaption="Grand Total")    #    << **** CODE CHANGE **** <<
pt$addRowDataGroups("PowerType")
pt$addRowDataGroups("SchedSpeedMPH", addTotal=FALSE)      #    << **** CODE CHANGE **** <<
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, comment=""---------------------------
library(pivottabler)
qpvt(bhmtrains, "TOC", "TrainCategory", "n()")

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
qhpvt(bhmtrains, c("=", "TOC"), c("TrainCategory", "PowerType"),
    c("Number of Trains"="n()", "Maximum Speed"="max(SchedSpeedMPH, na.rm=TRUE)"))

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
qhpvt(bhmtrains, "TOC", "TrainCategory", "mean(SchedSpeedMPH, na.rm=TRUE)", format="%.0f")

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
qhpvt(bhmtrains, "TOC", "TrainCategory", 
     c("Mean Speed"="mean(SchedSpeedMPH, na.rm=TRUE)", "Std Dev Speed"="sd(SchedSpeedMPH, na.rm=TRUE)"), 
     formats=list("%.0f", "%.1f"))

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
qhpvt(bhmtrains, "TOC", "TrainCategory", 
     c("Mean Speed"="mean(SchedSpeedMPH, na.rm=TRUE)", "Std Dev Speed"="sd(SchedSpeedMPH, na.rm=TRUE)"), 
     formats=list("%.0f", "%.1f"), totals=list("TOC"="All TOCs", "TrainCategory"="All Categories"))

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
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

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
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
pt$addColumnDataGroups("TOC", totalCaption="All TOCs")   #  << ***** CODE CHANGE ***** <<
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

pt$addRowCalculationGroups()                             #  << ***** CODE CHANGE ***** <<
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
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

## ---- message=FALSE, warning=FALSE, eval=TRUE, comment="", echo=FALSE----
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
pt$asMatrix()

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
# define the colours
blue1Colors <- list(
  headerBackgroundColor = "rgb(68, 114, 196)",
  headerColor = "rgb(255, 255, 255)",
  cellBackgroundColor = "rgb(255, 255, 255)",
  cellColor = "rgb(0, 0, 0)",
  totalBackgroundColor = "rgb(186, 202, 233)",
  totalColor = "rgb(0, 0, 0)",
  borderColor = "rgb(48, 84, 150)"
)
# define the theme
theme <- getSimpleColoredTheme(parentPivot=pt, colors=blue1Colors, fontName="Verdana, Arial")
# create the pivot table
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$theme <- theme
pt$renderPivot(styleNamePrefix="t3")

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
highlight <- PivotStyle$new(pt, "cellHighlight", list("background-color"="#FFFF00"))
groups <- pt$findColumnDataGroups(
  variableValues=list("TrainCategory"="Ordinary Passenger"), 
  includeDescendantGroup=TRUE)
groupCount <- lapply(groups, function(grp) {grp$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight <- PivotStyle$new(pt, "cellHighlight", list("background-color"="#00FF00"))
cells <- pt$getCells(specifyCellsAsList=TRUE, rowNumbers=2, columnNumbers=4, cellCoordinates=list(c(5, 7)))
cellCount <- lapply(cells, function(cell) {cell$style <- highlight})
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, message=FALSE, echo=FALSE------------
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
  cell$style <- PivotStyle$new(pt, "", list("background-color"=backClr, "color"=textClr))
}
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
cg1 <- pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger")
cg2 <- pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$defineCalculation(calculationGroupName="calcGrp2", calculationName="MaxSpeedMPH", 
                     summariseExpression="max(SchedSpeedMPH, na.rm=TRUE)")
cg3 <- cg1$addChildGroup(caption="Count")
cg4 <- cg2$addChildGroup(caption="Maximum Speed")
cg3$addCalculationGroups("default")
cg4$addCalculationGroups("calcGrp2")
pt$renderPivot()

