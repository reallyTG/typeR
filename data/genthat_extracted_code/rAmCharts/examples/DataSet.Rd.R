library(rAmCharts)


### Name: initialize,DataSet-method
### Title: Creates or updates a DataSet
### Aliases: initialize,DataSet-method dataSet
###   setDataProvider,DataSet,ANY,ANY-method setFieldMappings
###   setFieldMappings,DataSet,list-method addFieldMapping
###   addFieldMapping,DataSet-method setStockEvents
###   setStockEvents,DataSet,list-method addStockEvent
###   addStockEvent,DataSet,StockEventOrMissing-method

### ** Examples

new("DataSet")

dataSet(categoryField = "categoryField")

setDataProvider(.Object = dataSet(), data.frame(key = c("FR", "US"), value = c(20,10)))

dataset <- addFieldMapping(.Object = dataSet(),
                           fieldMappings = list(fromField ="val1", toField ="value"))
print(dataset)
dataset <- addFieldMapping(.Object = dataSet(), fromField ="val1", toField ="value")
print(dataset)
addStockEvent(.Object = dataSet(), backgroundAlpha = 1, backgroundColor = "#DADADA")
# equivalent to:
stockEvent_obj <- stockEvent(backgroundAlpha = 1, backgroundColor = "#DADADA")
chart <- addStockEvent(.Object = dataSet(), stockEvent = stockEvent_obj); print(chart)



