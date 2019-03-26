library(dygraphs)


### Name: dyLimit
### Title: dygraph limit line
### Aliases: dyLimit

### ** Examples

library(dygraphs)

dygraph(presidents, main = "Presidential Approval") %>%
  dyAxis("y", valueRange = c(0, 100)) %>% 
  dyLimit(max(presidents, na.rm = TRUE), "Max",
          strokePattern = "solid", color = "blue")
 



