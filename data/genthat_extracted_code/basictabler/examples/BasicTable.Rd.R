library(basictabler)


### Name: BasicTable
### Title: A class that defines a basic table.
### Aliases: BasicTable
### Keywords: datasets

### ** Examples

# The package vignettes have many more examples of working with the
# BasicTable class.
# Quickly rendering a table as an htmlwidget:
library(basictabler)
qhtbl(data.frame(a=1:2, b=3:4))
# Rendering a larger table as an htmlwidget:
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

tbl <- BasicTable$new()
columnHeaders <- c("TOC", "On-Time Arrivals", "On-Time Departures",
  "Total Trains", "On-Time Arrival %", "On-Time Departure %")
columnFormats=list()
columnFormats[[2]] <- list(big.mark=",")
columnFormats[[3]] <- list(big.mark=",")
columnFormats[[4]] <- list(big.mark=",")
columnFormats[[5]] <- "%.1f"
columnFormats[[6]] <- "%.1f"
tbl$addData(tocsummary, columnNamesAsColumnHeaders=FALSE,
  firstColumnAsRowHeaders=TRUE,
  explicitColumnHeaders=columnHeaders, columnFormats=columnFormats)
tbl$renderTable()



