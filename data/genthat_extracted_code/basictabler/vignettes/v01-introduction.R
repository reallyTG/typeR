## ---- message=FALSE------------------------------------------------------
# the qhtbl() function is explained later in this vignette
library(basictabler)
qhtbl(t(bhmsummary[1:4,]), rowNamesAsRowHeaders=TRUE)

## ---- message=FALSE, warning=FALSE, comment=""---------------------------
library(basictabler)
qtbl(data.frame(a=1:2, b=3:4))

## ---- message=FALSE, eval=FALSE, warning=FALSE, comment=""---------------
#  library(basictabler)
#  tbl <- qtbl(data.frame(a=1:2, b=3:4))

## ---- message=FALSE, eval=FALSE, warning=FALSE, comment=""---------------
#  library(basictabler)
#  tbl <- BasicTable$new()
#  tbl$addData(data.frame(a=1:2, b=3:4))

## ---- message=FALSE, eval=TRUE, warning=FALSE, comment=""----------------
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(a=1:2, b=3:4))
tbl$renderTable()

## ---- message=FALSE, eval=TRUE, warning=FALSE, comment=""----------------
library(basictabler)
qhtbl(data.frame(a=1:2, b=3:4))

## ---- message=FALSE, warning=FALSE, comment=""---------------------------
# aggregate the sample data to make a small data frame
library(basictabler)
library(dplyr)
tocsummary <- bhmsummary %>%
  group_by(TOC) %>%
  summarise(OnTimeArrivals=sum(OnTimeArrivals),
            OnTimeDepartures=sum(OnTimeDepartures),
            TotalTrains=sum(TrainCount)) %>%
  ungroup() %>%
  mutate(OnTimeArrivalPercent=OnTimeArrivals/TotalTrains*100,
         OnTimeDeparturePercent=OnTimeDepartures/TotalTrains*100) %>%
  arrange(TOC)

# To specify formatting, a list is created which contains one element for each column in 
# the data frame, i.e. tocsummary contains six columns so the columnFormats list has six elements.
# The values in the first column in the data frame won't be formatted since NULL has been specified.
# The values in the 2nd, 3rd and 4th columns will be formatted using format(value, big.mark=",")
# The values in the 5th and 6th columns will be formatted using sprintf(value, "%.1f")
columnFormats=list(NULL, list(big.mark=","), list(big.mark=","), list(big.mark=","), "%.1f", "%.1f")

# render the table directly as a html widget
qhtbl(tocsummary, firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("TOC", "On-Time Arrivals", "On-Time Departures",
                                    "Total Trains", "On-Time Arrival %", "On-Time Departure %"),
            columnFormats=columnFormats)

## ---- message=FALSE, warning=FALSE, comment=""---------------------------
# aggregate the sample data to make a small data frame
library(basictabler)
library(dplyr)
tocsummary <- bhmsummary %>%
  group_by(TOC) %>%
  summarise(OnTimeArrivals=sum(OnTimeArrivals),
            OnTimeDepartures=sum(OnTimeDepartures),
            TotalTrains=sum(TrainCount)) %>%
  ungroup() %>%
  mutate(OnTimeArrivalPercent=OnTimeArrivals/TotalTrains*100,
         OnTimeDeparturePercent=OnTimeDepartures/TotalTrains*100) %>%
  arrange(TOC)

# calculate the data for the total row
totalsummary <- bhmsummary %>%
  summarise(OnTimeArrivals=sum(OnTimeArrivals),
            OnTimeDepartures=sum(OnTimeDepartures),
            TotalTrains=sum(TrainCount)) %>%
  mutate(OnTimeArrivalPercent=OnTimeArrivals/TotalTrains*100,
         OnTimeDeparturePercent=OnTimeDepartures/TotalTrains*100)

# specify formatting
columnFormats=list(NULL, list(big.mark=","), list(big.mark=","), list(big.mark=","), "%.1f", "%.1f")

# generate the table
tbl <- qtbl(tocsummary, firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("TOC", "On-Time Arrivals", "On-Time Departures",
                                    "Total Trains", "On-Time Arrival %", "On-Time Departure %"),
            columnFormats=columnFormats)

# get the values for the totals row
values <- list("All TOC", totalsummary[1, ]$OnTimeArrivals, totalsummary[1, ]$OnTimeDepartures,
               totalsummary[1, ]$TotalTrains, totalsummary[1, ]$OnTimeArrivalPercent,
               totalsummary[1, ]$OnTimeDeparturePercent)

# add the totals row
tbl$cells$setRow(6, cellTypes=c("rowHeader", "total", "total", "total", "total", "total"),
                 rawValues=values, formats=columnFormats)

# render the table
tbl$renderTable()

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

# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
theme <- getSimpleColoredTblTheme(parentTable=tbl, colors=blue1Colors, fontName="Verdana, Arial")
tbl$theme <- theme
tbl$renderTable(styleNamePrefix="t3")

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
# aggregate the sample data to make a small data frame
library(basictabler)
library(dplyr)
tocsummary <- bhmsummary %>%
  group_by(TOC) %>%
  summarise(OnTimeArrivals=sum(OnTimeArrivals),
            OnTimeDepartures=sum(OnTimeDepartures),
            TotalTrains=sum(TrainCount)) %>%
  ungroup() %>%
  mutate(OnTimeArrivalPercent=OnTimeArrivals/TotalTrains*100,
         OnTimeDeparturePercent=OnTimeDepartures/TotalTrains*100) %>%
  arrange(TOC)

# formatting values (explained in the introduction vignette)
columnFormats=list(NULL, list(big.mark=","), list(big.mark=","), list(big.mark=","), "%.1f", "%.1f")

# create the table
tbl <- BasicTable$new()
tbl$addData(tocsummary, firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("TOC", "On-Time Arrivals", "On-Time Departures",
                                    "Total Trains", "On-Time Arrival %", "On-Time Departure %"),
            columnFormats=columnFormats)

# apply the red formatting
redStyle <- tbl$createInlineStyle(declarations=list("background-color"="#FFC7CE", "color"="#9C0006"))
cells <- tbl$findCells(columnNumbers=5:6, minValue=0, maxValue=40, includeNull=FALSE, includeNA=FALSE)
lst <- lapply(cells, function(cell) {cell$style <- redStyle})
# apply the yellow formatting
yellowStyle <- tbl$createInlineStyle(declarations=list("background-color"="#FFEB9C", "color"="#9C5700"))
cells <- tbl$findCells(columnNumbers=5:6, minValue=40, maxValue=60, includeNull=FALSE, includeNA=FALSE)
lst <- lapply(cells, function(cell) {cell$style <- yellowStyle})
# apply the green formatting
greenStyle <- tbl$createInlineStyle(declarations=list("background-color"="#C6EFCE", "color"="#006100"))
cells <- tbl$findCells(columnNumbers=5:6, minValue=60, maxValue=100, includeNull=FALSE, includeNA=FALSE)
lst <- lapply(cells, function(cell) {cell$style <- greenStyle})
tbl$renderTable()

