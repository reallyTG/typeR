library(manipulateWidget)


### Name: manipulateWidget
### Title: Add Controls to Interactive Plots
### Aliases: manipulateWidget

### ** Examples

if (require(dygraphs)) {

  mydata <- data.frame(year = 2000+1:100, value = rnorm(100))
  manipulateWidget(dygraph(mydata[range[1]:range[2] - 2000, ], main = title),
                   range = mwSlider(2001, 2100, c(2001, 2100)),
                   title = mwText("Fictive time series"))

}

# Comparison mode
if (require(dygraphs)) {

  mydata <- data.frame(
    year = 2000+1:100,
    series1 = rnorm(100),
    series2 = rnorm(100),
    series3 = rnorm(100)
  )

  manipulateWidget(
    dygraph(mydata[range[1]:range[2] - 2000, c("year", series)], main = title),
    range = mwSlider(2001, 2100, c(2001, 2100)),
    series = mwSelect(c("series1", "series2", "series3")),
    title = mwText("Fictive time series"),
    .compare = c("title", "series")
  )

  # Setting different initial values for each chart
  manipulateWidget(
    dygraph(mydata[range[1]:range[2] - 2000, c("year", series)], main = title),
    range = mwSlider(2001, 2100, c(2001, 2100)),
    series = mwSelect(c("series1", "series2", "series3")),
    title = mwText(),
    .compare = list(
      title = list("First chart", "Second chart"),
      series = NULL
    )
  )
}

# Grouping inputs
if (require(dygraphs)) {

  mydata <- data.frame(year = 2000+1:100, value = rnorm(100))
  manipulateWidget(dygraph(mydata[range[1]:range[2] - 2000, ],
                           main = title, xlab = xlab, ylab = ylab),
                   range = mwSlider(2001, 2100, c(2001, 2100)),
                   "Graphical parameters" = mwGroup(
                      title = mwText("Fictive time series"),
                      xlab = mwText("X axis label"),
                      ylab = mwText("Y axis label")
                   )
                  )

}

# Example of conditional input controls
#
# In this example, we plot a x series against a y series. User can choose to
# use points or lines. If he chooses lines, then an additional input is displayed
# to let him control the width of the lines.
if (require("plotly")) {

  dt <- data.frame (
    x = sort(runif(100)),
    y = rnorm(100)
  )

  myPlot <- function(type, lwd) {
    if (type == "points") {
      plot_ly(dt, x= ~x, y = ~y, type = "scatter", mode = "markers")
    } else {
      plot_ly(dt, x= ~x, y = ~y, type = "scatter", mode = "lines", line = list(width = lwd))
    }
  }

  manipulateWidget(
    myPlot(type, lwd),
    type = mwSelect(c("points", "lines"), "points"),
    lwd = mwSlider(1, 10, 1, .display = type == "lines")
  )

}

# Advanced Usage
#
# .expr is evaluated with extra variables .initial, .outputId and .session
# that can be used to update an already rendered widget instead of replacing
# it each time an input value is modified.
#
# Here we generate a UI that permits to change color and size of arbitrary
# points on a map generated with leaflet.

if (require(leaflet)) {
  lon <- rnorm(10, sd = 20)
  lat <- rnorm(10, sd = 20)

  myMapFun <- function(radius, color, initial, session, output) {
    if (initial) {
      # Widget has not been rendered
      map <- leaflet() %>% addTiles()
    } else {
      # widget has already been rendered
      map <- leafletProxy(output, session) %>% clearMarkers()
    }

    map %>% addCircleMarkers(lon, lat, radius = radius, color = color)
  }

  manipulateWidget(myMapFun(radius, color, .initial, .session, .output),
                   radius = mwSlider(5, 30, 10),
                   color = mwSelect(c("red", "blue", "green")))

}




