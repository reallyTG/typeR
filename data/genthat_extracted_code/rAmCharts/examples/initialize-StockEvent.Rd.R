library(rAmCharts)


### Name: initialize,StockEvent-method
### Title: Initialize a StockEvent
### Aliases: initialize,StockEvent-method stockEvent setStockGraph
###   setStockGraph,StockEvent,AmGraphOrCharacterOrMissing-method

### ** Examples

new("StockEvent")
stockEvent()
setStockGraph(.Object = stockEvent(), id = "stockGraph1", balloonText = "balloonText")
# equivalent to:
stockGraph_obj <- stockGraph(id = "stockGraph1", balloonText = "balloonText")
setStockGraph(.Object = stockEvent(), stockGraph = stockGraph_obj)
# if stockGraph_obj has already been added to the chart:
setStockGraph(.Object = stockEvent(), stockGraph = "stockGraph1")



