library(dygraphs)


### Name: dyShading
### Title: dygraph region shading
### Aliases: dyShading

### ** Examples

library(dygraphs)

dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyShading(from = "1920-1-1", to = "1930-1-1") %>%
  dyShading(from = "1940-1-1", to = "1950-1-1")
  
dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyShading(from = "48", to = "52", axis = "y") %>%
  dyShading(from = "50", to = "50.1", axis = "y", color = "black")
    



