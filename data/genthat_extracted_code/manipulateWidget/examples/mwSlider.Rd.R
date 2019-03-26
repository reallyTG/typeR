library(manipulateWidget)


### Name: mwSlider
### Title: Add a Slider to a manipulateWidget gadget
### Aliases: mwSlider

### ** Examples


if (require(plotly)) {

  myWidget <- manipulateWidget(
    plot_ly(data.frame(x = 1:n, y = rnorm(n)), x=~x, y=~y, type = "scatter", mode = "markers"),
    n = mwSlider(1, 100, 10, label = "Number of values")
  )

  Sys.sleep(0.5)

  # Create a double ended slider to choose a range instead of a single value
  mydata <- data.frame(x = 1:100, y = rnorm(100))

  manipulateWidget(
    plot_ly(mydata[n[1]:n[2], ], x=~x, y=~y, type = "scatter", mode = "markers"),
    n = mwSlider(1, 100, c(1, 10), label = "Number of values")
  )

}




