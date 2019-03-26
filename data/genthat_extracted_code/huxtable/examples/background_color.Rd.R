library(huxtable)


### Name: background_color
### Title: Background color
### Aliases: background_color background_color<- set_background_color
###   map_background_color

### ** Examples


background_color(jams) <-  grey(.95)
background_color(jams)


set_background_color(jams, grey(.95))
set_background_color(jams,
      2:3, 1, grey(.95))
map_background_color(jams,
      by_rows(grey(.95), "yellow"))



