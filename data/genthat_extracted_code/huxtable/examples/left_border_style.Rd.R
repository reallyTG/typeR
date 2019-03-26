library(huxtable)


### Name: left_border_style
### Title: Border styles
### Aliases: left_border_style left_border_style<- set_left_border_style
###   map_left_border_style right_border_style top_border_style
###   bottom_border_style right_border_style<- top_border_style<-
###   bottom_border_style<- set_right_border_style set_top_border_style
###   set_bottom_border_style map_right_border_style map_top_border_style
###   map_bottom_border_style

### ** Examples

ht <- huxtable(a = 1:3, b = 3:1)
ht <- set_all_borders(ht, 1)
set_left_border_style(ht, "double")
set_left_border_style(ht, 1:2, 1,
      "double")

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



