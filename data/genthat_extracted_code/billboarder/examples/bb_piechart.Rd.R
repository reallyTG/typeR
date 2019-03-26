library(billboarder)


### Name: bb_piechart
### Title: Helper for creating a pie chart
### Aliases: bb_piechart

### ** Examples


stars <- data.frame(
  package = c("billboarder", "ggiraph", "officer", "shinyWidgets", "visNetwork"),
  stars = c(9, 177, 43, 44, 169)
)

# Default
billboarder() %>% 
  bb_piechart(data = stars)

# Explicit mapping
billboarder() %>% 
  bb_piechart(data = stars, bbaes(package, stars))

# Other way to specify mapping
billboarder(data = stars) %>% 
  bb_aes(package, stars) %>% 
  bb_piechart()




