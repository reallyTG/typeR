library(rAmCharts)


### Name: initialize,StockPanel-method
### Title: Initialize a StockPanel
### Aliases: initialize,StockPanel-method stockPanel panel setDrawOnAxis
###   setDrawOnAxis,StockPanel,ValueAxisOrCharacterOrMissing-method
###   setStockGraphs setStockGraphs,StockPanel,list-method addStockGraph
###   addStockGraph,StockPanel,AmGraphOrMissing-method setStockLegend
###   setStockLegend,StockPanel,AmLegendOrMissing-method

### ** Examples

new("StockPanel", title = "Volume")

stockPanel(stockLegend = amLegend(useGraphSettings = TRUE))
panel(creditsPosition = "top-right")
panel(title = "top-right")
valueAxis_obj <- valueAxis(id = "valueAxis1")
setDrawOnAxis(.Object = stockPanel(), valueAxis = valueAxis_obj)
setDrawOnAxis(.Object = stockPanel(), valueAxis = "valueAxis1")
# ---
stockGraphs <- list(stockGraph(comparable = TRUE), stockGraph(comparable = FALSE)) 
setStockGraphs(.Object =  stockPanel(), stockGraphs = stockGraphs)
stockPanel(stockGraphs = stockGraphs)
# ---
stock_panel <- addStockGraph(.Object = stockPanel(), comparable = FALSE); print(stock_panel)
# or...
stock_panel <- addStockGraph(.Object = stockPanel(), stockGraph = stockGraph(comparable = FALSE))
# ---
setStockLegend(.Object = stockPanel(), valueTextRegular = "[[value]]")
# equivalent to:
stockLegend_obj <- stockLegend(valueTextRegular = "[[value]]")
setStockLegend(.Object = stockPanel(), stockLegend = stockLegend_obj)
# ---



