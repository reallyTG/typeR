library(dygraphs)


### Name: dySeries
### Title: dygraph data series
### Aliases: dySeries

### ** Examples

library(dygraphs)

lungDeaths <- cbind(ldeaths, mdeaths, fdeaths)

dygraph(lungDeaths, main = "Deaths from Lung Disease (UK)") %>%
  dySeries("mdeaths", drawPoints = TRUE, color = "blue") %>%
  dySeries("fdeaths", stepPlot = TRUE, color = "red")   
  



