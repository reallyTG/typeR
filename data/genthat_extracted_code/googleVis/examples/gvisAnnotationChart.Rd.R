library(googleVis)


### Name: gvisAnnotationChart
### Title: Google Annotation Chart with R
### Aliases: gvisAnnotationChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires Internet
## connection to display the visualisation.


data(Stock)
Stock
A1 <- gvisAnnotationChart(Stock, datevar="Date",
                           numvar="Value", idvar="Device",
                           titlevar="Title", annotationvar="Annotation",
                           options=list(displayAnnotations=TRUE,
                            legendPosition='newRow',
                            width=600, height=350)
                           )
plot(A1)

## Two Y-axis
A2 <- gvisAnnotationChart(Stock, datevar="Date",
                           numvar="Value", idvar="Device",
                           titlevar="Title", annotationvar="Annotation",
                           options=list(displayAnnotations=TRUE, 
                            width=600, height=350, scaleColumns='[0,1]',
                            scaleType='allmaximized')
                          )
plot(A2)

## Zoom into the time window, no Y-axis ticks
A3 <- gvisAnnotationChart(Stock, datevar="Date",
                           numvar="Value", idvar="Device",
                           titlevar="Title", annotationvar="Annotation",
                           options=list(
                             width=600, height=350,
                            zoomStartTime=as.Date("2008-01-04"),
                            zoomEndTime=as.Date("2008-01-05")) 
                          )
plot(A3)



## Colouring the area below the lines to create an area chart
A4 <- gvisAnnotationChart(Stock, datevar="Date",
                           numvar="Value", idvar="Device",
                           titlevar="Title", annotationvar="Annotation",
                           options=list(
                             width=600, height=350,
                             fill=10, displayExactValues=TRUE,
                             colors="['#0000ff','#00ff00']")
                           )
                          
plot(A4)


## Data with POSIXct datetime variable
A5 <- gvisAnnotationChart(Andrew, datevar="Date/Time UTC",
                            numvar="Pressure_mb",
                            options=list(scaleType='maximized')
                            )

plot(A5)


## Not run: 
##D 
##D ## Plot Apple's monthly stock prices since 1984
##D 
##D ## Get current date
##D d <- Sys.time() 
##D current.year <- format(d, "%Y")
##D current.month <- format(d, "%m")
##D current.day <- format(d, "%d")
##D 
##D ## Yahoo finance sets January to 00 hence: 
##D month <- as.numeric(current.month)  - 1
##D month <- ifelse(month < 10, paste("0",month, sep=""), m)
##D 
##D ## Get weekly stock prices from Apple Inc.
##D tckr <- 'AAPL'
##D yahoo <- 'http://ichart.finance.yahoo.com/table.csv'
##D 
##D fn <- sprintf('%s?s=%s&a=08&b=7&c=1984&d=%s&e=%s&f=%s&g=w&ignore=.csv',
##D       yahoo, tckr, month, current.day, current.year)
##D 
##D ## Get data from Yahoo! Finance
##D data <- read.csv(fn, colClasses=c("Date", rep("numeric",6)))
##D 
##D AAPL <- reshape(data[,c("Date", "Close", "Volume")], idvar="Date", 
##D      		times=c("Close", "Volume"), 
##D                 timevar="Type",
##D                 varying=list(c("Close", "Volume")),
##D                 v.names="Value",
##D                 direction="long")
##D 
##D ## Calculate previous two years for zoom start time
##D lyd <- as.POSIXlt(as.Date(d))
##D lyd$year <- lyd$year-2
##D lyd <- as.Date(lyd)
##D 
##D aapl <- gvisAnnotationChart(AAPL, datevar="Date",
##D                            numvar="Value", idvar="Type",
##D                           options=list(
##D                             colors="['blue', 'lightblue']",
##D                             zoomStartTime=lyd,
##D                             zoomEndTime=as.Date(d),
##D                             legendPosition='newRow',
##D                             width=600, height=400, scaleColumns='[0,1]',
##D                             scaleType='allmaximized')
##D                            )
##D 
##D plot(aapl)
## End(Not run)




