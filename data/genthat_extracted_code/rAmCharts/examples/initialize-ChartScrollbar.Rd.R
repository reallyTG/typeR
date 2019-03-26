library(rAmCharts)


### Name: initialize,ChartScrollbar-method
### Title: Initializes a ChartScrollbar
### Aliases: initialize,ChartScrollbar-method chartScrollbar
###   chartScrollbarSettings
###   setGraph,ChartScrollbar,AmGraphOrCharacterOrMissing-method setEnabled
###   setEnabled,ChartScrollbar,logical-method

### ** Examples

new("ChartScrollbar", graph = "g1")
new("ChartScrollbar", graph = amGraph(test = 1))
chartScrollbar()
chartScrollbar(enabled = TRUE)
chartScrollbar()
chartScrollbar(enabled = TRUE)
# chartScrollbar with default graph
setGraph(.Object = chartScrollbar())

# example with arguments
setGraph(.Object = chartScrollbar(), id = "graph1", balloonText = "performance")
# equivalent to:
graph_obj <- amGraph(id = "graph1", balloonText = "performance")
(chartScrollbar_obj <- setGraph(.Object = chartScrollbar(), graph = graph_obj))
# or, iff graph_obj has alreadey been added to the chart:
setGraph(.Object = chartScrollbar(), graph = "graph1")
## Don't show: 
print(chartScrollbar_obj)
## End(Don't show)
# ---
setEnabled(.Object = chartScrollbar(), enabled = TRUE)



