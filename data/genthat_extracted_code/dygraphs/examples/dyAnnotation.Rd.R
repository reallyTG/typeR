library(dygraphs)


### Name: dyAnnotation
### Title: Annotation for dygraph chart
### Aliases: dyAnnotation

### ** Examples

library(dygraphs)
  
dygraph(presidents, main = "Presidential Approval") %>%
  dyAxis("y", valueRange = c(0, 100)) %>%
  dyAnnotation("1950-7-1", text = "A", tooltip = "Korea") %>%
  dyAnnotation("1965-1-1", text = "B", tooltip = "Vietnam")   
  



