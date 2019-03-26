library(rAmCharts)


### Name: initialize,AmGraph-method
### Title: Initializes an AmGraph
### Aliases: initialize,AmGraph-method amGraph graph setBalloonText
###   setBalloonText,AmGraph,character-method
###   setTitle,AmGraph,character-method setType,AmGraph,character-method
###   setValueField setValueField,AmGraph,character-method

### ** Examples

# --- method 'initialize'
new("AmGraph", valueField = "value")

# constructor
amGraph(balloonText = "My text")
## Not run: 
##D amGraph(balloonText = "balloonText", "type" = "column", title = "myGraph!",
##D         valueField = "value", animationPlayed = TRUE, other = TRUE)
## End(Not run)
amGraph(balloonText = "some text")
# --- shortcut constructor
graph(balloonText = "balloonText", "type" = "column",
      valueField = "value", animationPlayed = TRUE)
      
# --- update 'balloonText'
setBalloonText(.Object = amGraph(), balloonText = "performance")

# --- update 'title'
setTitle(.Object = amGraph(), title = "Power")

# --- update 'type'
setType(.Object = amGraph(), type = "type")

# --- update valueField
setValueField(.Object = amGraph(), valueField = "score")




