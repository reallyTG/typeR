library(rAmCharts)


### Name: addListener
### Title: AmObject methods
### Aliases: addListener addListener,AmObject,character,character-method
###   resetProperties resetProperties,AmObject-method setProperties
###   setProperties,AmObject-method

### ** Examples

addListener(.Object = amPieChart(),
            name = "clickSlice" ,
            expression = "function(event){ alert('ok !'); }")
            
addListener(.Object = amLegend(),
            name = "select",
            expression = paste0("function onSelect (properties) {",
                                "alert('selected nodes: ' + properties.nodes);",
                                "}"))
library(pipeR)
amPlot(runif(10)) %>>% resetProperties("categoryAxis") %>>% print(withDetail = FALSE)
library(pipeR)
# either you can set a list
ls <- list(categoryAxis = list(gridPosition = "start"), fontSize = 15)
amSerialChart() %>>% setProperties(list = ls)  %>>% print()

# or you can set one or more properties
amPieChart() %>>% setProperties(handDrawn = TRUE, fontSize = 15) %>>% print()

# overwrite a property
amPieChart() %>>%  setProperties(fontSize = 15) %>>%  setProperties(fontSize = 12) %>>% print()

# Carefull if you try to set a property which is a slot...
# in that case, use the setter methods 'setXX' or 'addXX' which check the validity
## Not run: 
##D amPieChart() %>>% setProperties(type = "serial") %>>% print()
## End(Not run)

amPieChart() %>>% setExport()



