library(tis)


### Name: tisPlot
### Title: Plot time indexed series (tis objects)
### Aliases: tisPlot
### Keywords: ts hplot

### ** Examples

firstTis <- tis(cumsum(rnorm(120)), start = c(1996,1), freq = 12)
secondTis <- tis(cumsum(rnorm(120)), start = c(1996,1), freq = 12)
tisPlot(firstTis, secondTis, color = c("red", "green"),
           lineType = "solid", head = "Two Random Walks")
tisLegend(legend = c("Random Walk 1", "Random Walk 2"))

series <- tis(cumsum(rnorm(200)), start = c(1960,1), tif = "quarterly")
tisPlot(series, xMinorTickFreq = "annual", nberShade = TRUE,
        head = "A Random Walk", sub = "Looks like an econ series",
        rightTopLabel = "$Billions")
romerLines()



