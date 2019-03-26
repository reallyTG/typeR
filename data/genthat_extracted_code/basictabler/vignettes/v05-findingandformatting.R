## ---- message=FALSE, warning=FALSE---------------------------------------
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

# create the table and render
tbl <- BasicTable$new()
tbl$addData(tocsummary, firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("TOC", "On-Time Arrivals", "On-Time Departures",
                                    "Total Trains", "On-Time Arrival %", "On-Time Departure %"),
            columnFormats=columnFormats)
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# get the cells and apply styling
highlight <- tbl$createInlineStyle(declarations=list("background-color"="#FFCC66"))
cells <- tbl$getCells(specifyCellsAsList=TRUE, rowNumbers=c(1, 3))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# get the cells and apply styling
highlight <- tbl$createInlineStyle(declarations=list("background-color"="#FFCC66"))
cells <- tbl$getCells(specifyCellsAsList=TRUE, columnNumbers=2)
lst <- lapply(cells, function(cell) {cell$style <- highlight})
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# get the cells and apply styling
highlight <- tbl$createInlineStyle(declarations=list("background-color"="#FFCC66"))
cells <- tbl$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(2, 3)))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
cat("The raw value of the cell is", cells[[1]]$rawValue, "and the formatted value is", cells[[1]]$formattedValue, ".")
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# get the cells and apply styling
highlight <- tbl$createInlineStyle(declarations=list("background-color"="#FFCC66"))
cells <- tbl$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(2, 3), c(3, 4), c(5, 6)))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# get the cells and apply styling
highlight <- tbl$createInlineStyle(declarations=list("background-color"="#FFCC66"))
cells <- tbl$getCells(specifyCellsAsList=TRUE, rowNumbers=2, columnNumbers=4, cellCoordinates=list(c(5, 6)))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# get the cells and apply styling
highlight <- tbl$createInlineStyle(declarations=list("background-color"="#00FF00"))
cells <- tbl$getCells(specifyCellsAsList=FALSE, rowNumbers=c(1, 3))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# get the cells and apply styling
highlight <- tbl$createInlineStyle(declarations=list("background-color"="#00FF00"))
cells <- tbl$getCells(specifyCellsAsList=FALSE, columnNumbers=2)
lst <- lapply(cells, function(cell) {cell$style <- highlight})
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# get the cells and apply styling
highlight <- tbl$createInlineStyle(declarations=list("background-color"="#00FF00"))
cells <- tbl$getCells(specifyCellsAsList=FALSE, rowNumbers=2, columnNumbers=3)
lst <- lapply(cells, function(cell) {cell$style <- highlight})
cat("The raw value of the cell is", cells[[1]]$rawValue, "and the formatted value is", cells[[1]]$formattedValue, ".")
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# get the cells and apply styling
highlight <- tbl$createInlineStyle(declarations=list("background-color"="#00FF00"))
cells <- tbl$getCells(specifyCellsAsList=FALSE, rowNumbers=c(2, 3, 5), columnNumbers=c(3, 4, 6))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# get the cells and apply styling
highlight <- tbl$createInlineStyle(declarations=list("background-color"="#00FF00"))
cells <- tbl$getCells(specifyCellsAsList=FALSE, rowNumbers=c(2, NA, 5), columnNumbers=c(NA, 4, 6))
lst <- lapply(cells, function(cell) {cell$style <- highlight})
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

# apply the formatting
redStyle <- tbl$createInlineStyle(declarations=list("background-color"="#FFC7CE", "color"="#9C0006"))
cells <- tbl$findCells(columnNumbers=5:6, minValue=0, maxValue=40, includeNull=FALSE, includeNA=FALSE)
lst <- lapply(cells, function(cell) {cell$style <- redStyle})
tbl$renderTable()

## ---- message=FALSE, warning=FALSE---------------------------------------
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

