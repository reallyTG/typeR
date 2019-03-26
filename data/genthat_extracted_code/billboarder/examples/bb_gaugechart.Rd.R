library(billboarder)


### Name: bb_gaugechart
### Title: Helper for creating a gauge
### Aliases: bb_gaugechart

### ** Examples

billboarder() %>% 
  bb_gaugechart(value = 50)

# With some options
billboarder() %>% 
  bb_gaugechart(
    value = 160,
    steps_color = rev(c("#FF0000", "#F97600", "#F6C600", "#60B044"))
  ) %>% 
  bb_gauge(
    label = list(format = suffix("km/h")),
    min = 10, max = 200, width = 20
  )




