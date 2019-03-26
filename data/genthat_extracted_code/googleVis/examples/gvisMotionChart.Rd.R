library(googleVis)


### Name: gvisMotionChart
### Title: Google Motion Chart with R
### Aliases: gvisMotionChart
### Keywords: iplot

### ** Examples

## Please note that by default the googleVis plot command
## will open a browser window and requires Flash and Internet
## connection to display the visualisation.
M1 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
plot(M1)

## Not run: 
##D ## Usage of date variable
##D M2 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Date",
##D                       date.format = "%Y%m%d") 
##D                       plot(M2)
##D                       
##D ## Display weekly data:
##D M3 <- gvisMotionChart(Fruits, "Fruit", "Date", date.format="%YW%W")
##D plot(M3) 
## End(Not run)
## Options: no side panel on the right
M4 <- gvisMotionChart(Fruits,"Fruit", "Year",
                      options=list(showSidePanel=FALSE))
plot(M4)

## Options: trails un-ticked
M5 <- gvisMotionChart(Fruits, "Fruit", "Year",
                      options=list(state='{"showTrails":false};'))
                      
plot(M5)

## You can change some of displaying settings via the browser,
## e.g. the level of opacity of non-selected items, or the chart type.
## The state string from the 'Advanced' tab can be used to set those
## settings via R. Just copy and past the string from the browser into
## the argument state of the options list.
## Here is an example of a motion chart, with an initial line chart
## displayed. Ensure that you have a newline at the start and end of
## your settings string.

myStateSettings <-'
{"xZoomedDataMin":1199145600000,"colorOption":"2",
"duration":{"timeUnit":"Y","multiplier":1},"yLambda":1,
"yAxisOption":"4","sizeOption":"_UNISIZE",
"iconKeySettings":[],"xLambda":1,"nonSelectedAlpha":0,
"xZoomedDataMax":1262304000000,"iconType":"LINE",
"dimensions":{"iconDimensions":["dim0"]},
"showTrails":false,"uniColorForNonSelected":false,
"xAxisOption":"_TIME","orderedByX":false,"playDuration":15000,
"xZoomedIn":false,"time":"2010","yZoomedDataMin":0,
"yZoomedIn":false,"orderedByY":false,"yZoomedDataMax":100}
'
M6a <- gvisMotionChart(Fruits, "Fruit", "Year", 
                       options=list(state=myStateSettings))
plot(M6a)

## Newline set explicitly
myStateSettings <-'\n{"iconType":"LINE"}\n'
M6b <- gvisMotionChart(Fruits, "Fruit", "Year", 
                       options=list(state=myStateSettings))
plot(M6b)


## Define which columns are used for the initial setup of the various
## dimensions
M7 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year",
                      xvar="Profit", yvar="Expenses",
                      colorvar="Location", sizevar="Sales")
plot(M7)
## For more information see:
## https://developers.google.com/chart/interactive/docs/gallery/motionchart

## See also the demo(WorldBank). It demonstrates how you can access
## country level data from the World Bank to create Gapminder-like
## plots.
 



