library(rAmCharts)


### Name: initialize,CategoryAxis-method
### Title: Initializes a CategoryAxis
### Aliases: initialize,CategoryAxis-method categoryAxis setGridPosition
###   setGridPosition,CategoryAxis,character-method

### ** Examples

guides <- list(guide(fillAlpha = .4, adjustBorderColor = TRUE),
               guide(fillAlpha = .4, adjustBorderColor = TRUE))
new("CategoryAxis", gridPosition = "start",  gridThickness = 1, guides = guides)

## No test: 
new("CategoryAxis")
new("CategoryAxis", gridPosition = "start", 1) # 1 is not take into account
## End(No test)

categoryAxis(gridPosition = "start", adjustBorderColor = TRUE)

setGridPosition(.Object = categoryAxis(), gridPosition = "start")



