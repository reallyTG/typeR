library(shinyaframe)


### Name: aDataScene
### Title: A-Frame Scene with R data
### Aliases: aDataScene

### ** Examples

library(dplyr)
library(scales)

# Execute within a renderADataScene call in a Shiny server
iris %>%
  # scale positional data to (0,1)
  mutate_if(is.numeric, rescale) %>%
  # make data available in JavaScript
  aDataScene()




