library(dygraphs)


### Name: dyHighlight
### Title: dygraph series mouse-over highlighting
### Aliases: dyHighlight

### ** Examples

library(dygraphs)
lungDeaths <- cbind(ldeaths, mdeaths, fdeaths)
dygraph(lungDeaths, main = "Deaths from Lung Disease (UK)") %>%
  dyHighlight(highlightCircleSize = 5, 
              highlightSeriesBackgroundAlpha = 0.2,
              hideOnMouseOut = FALSE)   
 



