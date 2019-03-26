library(dygraphs)


### Name: dyLegend
### Title: dygraph legend
### Aliases: dyLegend

### ** Examples

library(dygraphs)

dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dySeries("V1", label = "Temperature (F)") %>%
  dyLegend(show = "always", hideOnMouseOut = FALSE)   
    



