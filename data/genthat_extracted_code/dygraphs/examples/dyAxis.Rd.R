library(dygraphs)


### Name: dyAxis
### Title: dygraph axis
### Aliases: dyAxis

### ** Examples

library(dygraphs)

dygraph(nhtemp, main = "New Haven Temperatures") %>%
  dyAxis("y", label = "Temp (F)", valueRange = c(40, 60)) %>%
  dyOptions(axisLineWidth = 1.5, fillGraph = TRUE, drawGrid = FALSE)
    



