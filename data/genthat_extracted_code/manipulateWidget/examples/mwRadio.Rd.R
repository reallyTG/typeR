library(manipulateWidget)


### Name: mwRadio
### Title: Add radio buttons to a manipulateWidget gadget
### Aliases: mwRadio

### ** Examples

if (require(plotly)) {
  mydata <- data.frame(x = 1:100, y = rnorm(100))

  manipulateWidget(
    {
      mode <- switch(type, points = "markers", lines = "lines", both = "markers+lines")
      plot_ly(mydata, x=~x, y=~y, type = "scatter", mode = mode)
    },
    type = mwRadio(c("points", "lines", "both"))
  )
}




