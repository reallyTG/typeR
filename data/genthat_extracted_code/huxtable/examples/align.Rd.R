library(huxtable)


### Name: align
### Title: Alignment
### Aliases: align align<- set_align map_align

### ** Examples


align(jams) <-  "right"
align(jams)


set_align(jams, "right")
set_align(jams,
      2:3, 1, "right")
map_align(jams,
      by_rows("right", "left"))



