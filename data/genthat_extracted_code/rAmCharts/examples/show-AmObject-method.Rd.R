library(rAmCharts)


### Name: show,AmObject-method
### Title: Visualize with show
### Aliases: show,AmObject-method

### ** Examples

library(pipeR)
amPieChart(valueField = "value", titleField = "key", backgroundColor = "#7870E8") %>>%
  setDataProvider(data.frame(key = c("FR", "US"), value = c(20,10))) %>>%
  setExport(position = "bottom-left")



