library(shiny)


### Name: nearPoints
### Title: Find rows of data that are near a click/hover/double-click
### Aliases: nearPoints

### ** Examples

## Not run: 
##D # Note that in practice, these examples would need to go in reactives
##D # or observers.
##D 
##D # This would select all points within 5 pixels of the click
##D nearPoints(mtcars, input$plot_click)
##D 
##D # Select just the nearest point within 10 pixels of the click
##D nearPoints(mtcars, input$plot_click, threshold = 10, maxpoints = 1)
##D 
## End(Not run)



