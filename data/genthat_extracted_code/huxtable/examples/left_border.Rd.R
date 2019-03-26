library(huxtable)


### Name: left_border
### Title: Borders
### Aliases: left_border left_border<- set_left_border map_left_border
###   right_border top_border bottom_border right_border<- top_border<-
###   bottom_border<- set_right_border set_top_border set_bottom_border
###   map_right_border map_top_border map_bottom_border

### ** Examples


left_border(jams) <-  1
left_border(jams)
jams

set_left_border(jams, 1)
set_left_border(jams,
      2:3, 1, 1)
map_left_border(jams,
      by_rows(1, 0))
# When cells span multiple rows:
ht <- tribble_hux(
  ~Col1,                   ~Col2,
  "Cell 1,1 spans 2 rows", "Cell 1,2",
  "Cell 2,1 is invisible", "Cell 2,2"
)

rowspan(ht)[1, 1] <- 2
ht

bottom_border(ht)[2, ] <- 1
bottom_border_color(ht)[2, ] <- 'red'

# Cell 1, 1 does not have a border set:
ht

# Fixed:
bottom_border(ht)[1, 1] <- 1
bottom_border_color(ht)[1, 1] <- 'red'
ht



