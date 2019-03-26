library(manipulateWidget)


### Name: mwNumeric
### Title: Add a numeric input to a manipulateWidget gadget
### Aliases: mwNumeric

### ** Examples


if (require(plotly)) {
  manipulateWidget({
      plot_ly(data.frame(x = 1:10, y = rnorm(10, mean, sd)), x=~x, y=~y,
              type = "scatter", mode = "markers")
    },
    mean = mwNumeric(0),
    sd = mwNumeric(1, min = 0, step = 0.1)
  )
}




