library(rAmCharts)


### Name: initialize,AmStockChart-method
### Title: Initializes an AmStockChart
### Aliases: initialize,AmStockChart-method amStockChart
###   setBalloon,AmStockChart,AmBalloonOrMissing-method
###   setCategoryAxesSettings setCategoryAxesSettings,AmStockChart-method
###   setChartCursorSettings setChartCursorSettings,AmStockChart-method
###   setChartScrollbarSettings
###   setChartScrollbarSettings,AmStockChart,ChartScrollbarOrMissing-method
###   setComparedDataSets setComparedDataSets,AmStockChart-method
###   addComparedDataSet
###   addComparedDataSet,AmStockChart,DataSetOrMissing-method setDataSets
###   setDataSets,AmStockChart-method addDataSet
###   addDataSet,AmStockChart,DataSetOrMissing-method setDataSetSelector
###   setDataSetSelector,AmStockChart-method setLegendSettings
###   setLegendSettings,AmStockChart-method setMainDataSet
###   setMainDataSet,AmStockChart,DataSetOrMissing-method setPanels
###   setPanels,AmStockChart,list-method addPanel
###   addPanel,AmStockChart,StockPanelOrMissing-method setPanelsSettings
###   setPanelsSettings,AmStockChart-method setPeriodSelector
###   setPeriodSelector,AmStockChart,PeriodSelectorOrMissing-method
###   setStockEventsSettings setStockEventsSettings,AmStockChart-method
###   setValueAxesSettings setValueAxesSettings,AmStockChart-method

### ** Examples

## No test: 
# --- method 'initialize'
new("AmStockChart", theme = "dark")
## End(No test)

## No test: 
# --- constructor
amStockChart()
## End(No test)
library(pipeR)

## No test: 
# Dummy example
amStockChart() %>>% setBalloon(gridPosition = "start")
## End(No test)
## No test: 
# Dummy example
setCategoryAxesSettings(.Object = amStockChart(), gridPosition = "start")
## End(No test)
## No test: 
# Dummy example
setChartCursorSettings(.Object = amStockChart(), oneBallOnly = TRUE)
## End(No test)
## No test: 
# Dummy example
amchart <- setChartScrollbarSettings(.Object = amStockChart(), enabled = TRUE)
print(amchart)

# equivalent to:
chartScrollbarSettings_obj <- chartScrollbarSettings()
setChartScrollbarSettings(.Object = amStockChart(),
                          chartScrollbarSettings = chartScrollbarSettings_obj)
## End(No test)
## No test: 
# Dummy example
comparedDataSets_ls <- list(dataSet(compared = TRUE), dataSet(compared = TRUE))
setComparedDataSets(.Object = amStockChart(), comparedDataSets = comparedDataSets_ls)
## End(No test)
## No test: 
# Dummy example
addComparedDataSet(.Object = amStockChart(), compared = TRUE)
## End(No test)
## No test: 
# Dummy example
dataSets_ls <- list(dataSet(compared = FALSE), dataSet(compared = FALSE))
setDataSets(.Object = amStockChart(), dataSets = dataSets_ls)
## End(No test)
## No test: 
# Dummy example
addDataSet(.Object = amStockChart(), compared = FALSE)
# equivalent to:
dataSet_obj <- dataSet(compared = FALSE)
addDataSet(.Object = amStockChart(), dataSet = dataSet_obj)
## End(No test)
## No test: 
# Dummy example
print(setDataSetSelector(.Object = amStockChart(), width = 180))

# equivalent to:
dataSetSelector_obj <- dataSetSelector(width = 180)
print(setDataSetSelector(.Object = amStockChart(),
                         dataSetSelector = dataSetSelector_obj))
## End(No test)
## No test: 
# Dummy example
setLegendSettings(.Object = amStockChart(), equalWidths = TRUE)
## End(No test)
## No test: 
# Dummy example
setMainDataSet(.Object = amStockChart(), showInCompare = TRUE)
## End(No test)
## No test: 
# Dummy example
panels_ls <- list(stockPanel(compared = TRUE), stockPanel(compared = TRUE))
setPanels(.Object = amStockChart(), panels = panels_ls)
## End(No test)
## No test: 
# Dummy example
chart <- addPanel(.Object = amStockChart(), allowTurningOff = TRUE); print(chart)
# equivalent to:
panel_obj <- panel(allowTurningOff = TRUE)
addPanel(.Object = amStockChart(), panel = panel_obj)
## End(No test)
## No test: 
# Dummy example
setPanelsSettings(.Object = amStockChart(), backgroundAlpha = 0)
## End(No test)
## No test: 
# Dummy example
setPeriodSelector(.Object = amStockChart(), dateFormat = "DD-MM-YYYY")
## End(No test)
## No test: 
# Dummy example
setStockEventsSettings(.Object = amStockChart(), backgroundAlpha = 1)
## End(No test)
## No test: 
# Dummy example
setValueAxesSettings(.Object = amStockChart(), autoGridCount = "TRUE")
## End(No test)



