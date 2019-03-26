library(huxtable)


### Name: left_border_color
### Title: Border colors
### Aliases: left_border_color left_border_color<- set_left_border_color
###   map_left_border_color right_border_color top_border_color
###   bottom_border_color right_border_color<- top_border_color<-
###   bottom_border_color<- set_right_border_color set_top_border_color
###   set_bottom_border_color map_right_border_color map_top_border_color
###   map_bottom_border_color

### ** Examples

ht <- huxtable(a = 1:3, b = 3:1)
ht <- set_all_borders(ht, 1)
set_left_border_color(ht, "red")
set_left_border_color(ht,
      1:2, 1, "red")

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



