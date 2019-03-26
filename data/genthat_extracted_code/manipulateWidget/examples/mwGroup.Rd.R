library(manipulateWidget)


### Name: mwGroup
### Title: Group inputs in a collapsible box
### Aliases: mwGroup

### ** Examples

if(require(dygraphs)) {
  mydata <- data.frame(x = 1:100, y = rnorm(100))
  manipulateWidget(
    dygraph(mydata[range[1]:range[2], ],
            main = title, xlab = xlab, ylab = ylab),
    range = mwSlider(1, 100, c(1, 100)),
    "Graphical parameters" = mwGroup(
      title = mwText("Fictive time series"),
      xlab = mwText("X axis label"),
      ylab = mwText("Y axis label")
    )
  )
}




