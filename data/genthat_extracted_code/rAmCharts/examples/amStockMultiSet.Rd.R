library(rAmCharts)


### Name: amStockMultiSet
### Title: Plotting multi data-sets
### Aliases: amStockMultiSet

### ** Examples


## Not run: 
##D data(data_stock_3)
##D 
##D amStockMultiSet(data = data_stock_3)
##D amStockMultiSet(data = data_stock_3, panelColumn = c(1,2,1,1))
##D 
##D amStockMultiSet(data = data_stock_3, panelColumn = c(1,2,3,4))
##D 
##D ZoomButton <- data.frame(Unit = c("DD", "DD", "MAX"), multiple = c(1, 10 ,1),
##D                    label = c("Day","10 days", "MAX"))
##D                    ZoomButtonPosition <- "bottom"
##D amStockMultiSet(data = data_stock_3, panelColumn = c(1,2,1,1), ZoomButton = ZoomButton,
##D ZoomButtonPosition = "top")
##D 
##D amStockMultiSet(data = data_stock_3, precision = 2)
##D 
##D amStockMultiSet(data = data_stock_3, panelColumn = c(1,2,1,1), percentHeightPanel = c(3,1))
## End(Not run)





