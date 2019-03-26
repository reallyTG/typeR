library(manipulateWidget)


### Name: mwSharedValue
### Title: Shared Value
### Aliases: mwSharedValue

### ** Examples


if (require(plotly)) {
  # Plot the characteristics of a car and compare with the average values for
  # cars with same number of cylinders.
  # The shared variable 'subsetCars' is used to avoid subsetting multiple times
  # the data: this value is updated only when input 'cylinders' changes.
  colMax <- apply(mtcars, 2, max)

  plotCar <- function(cardata, carName) {
    carValues <- unlist(cardata[carName, ])
    carValuesRel <- carValues / colMax

    avgValues <- round(colMeans(cardata), 2)
    avgValuesRel <- avgValues / colMax

    plot_ly() %>%
      add_bars(x = names(cardata), y = carValuesRel, text = carValues,
               hoverinfo = c("x+text"), name = carName) %>%
      add_bars(x = names(cardata), y = avgValuesRel, text = avgValues,
               hoverinfo = c("x+text"), name = "average") %>%
      layout(barmode = 'group')
  }

  c <- manipulateWidget(
    plotCar(subsetCars, car),
    cylinders = mwSelect(c("4", "6", "8")),
    subsetCars = mwSharedValue(subset(mtcars, cylinders == cyl)),
    car = mwSelect(choices = row.names(subsetCars))
  )
}




