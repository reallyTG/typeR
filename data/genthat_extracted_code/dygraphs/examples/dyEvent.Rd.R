library(dygraphs)


### Name: dyEvent
### Title: dygraph event line
### Aliases: dyEvent

### ** Examples

library(dygraphs)

dygraph(presidents, main = "Presidential Approval") %>%
  dyAxis("y", valueRange = c(0, 100)) %>%
  dyEvent("1950-6-30", "Korea", labelLoc = "bottom") %>%
  dyEvent("1965-2-09", "Vietnam", labelLoc = "bottom")
dygraph(presidents, main = "Presidential Approval") %>%
  dyAxis("y", valueRange = c(0, 100)) %>%
  dyEvent(c("1950-6-30", "1965-2-09"), c("Korea", "Vietnam"), labelLoc = "bottom") 
 



