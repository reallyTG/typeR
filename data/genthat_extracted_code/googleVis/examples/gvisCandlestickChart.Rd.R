library(googleVis)


### Name: gvisCandlestickChart
### Title: Google Candlestick chart with R
### Aliases: gvisCandlestickChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.

## Example data set
OpenClose

C1 <- gvisCandlestickChart(OpenClose, xvar="Weekday", low="Low",
                                      open="Open", close="Close",
                                      high="High",
                                      options=list(legend='none'))

plot(C1)





