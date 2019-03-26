library(huxtable)


### Name: set-multiple
### Title: Set left, right, top and bottom properties
### Aliases: set-multiple set_multiple set_all_borders map_all_borders
###   set_all_border_colors map_all_border_colors set_all_border_styles
###   map_all_border_styles set_all_padding map_all_padding
###   set_outer_borders

### ** Examples

ht <- huxtable(a = 1:3, b = 1:3)
set_all_borders(ht, 1:3, 1:2, 1)
ht <- set_all_border_colors(ht, "red")
ht <- set_all_border_styles(ht, "double")
ht <- set_all_padding(ht, 1:3, 1:2, "20px")
ht2 <- huxtable(a = 1:3, b = 1:3)
set_outer_borders(ht2, 1)
set_outer_borders(ht2, 2:3, 1:2, 1)

# Problems with colspan:
rowspan(ht2)[2, 1] <- 2
set_outer_borders(ht2, 1:2, 1:2, 1)




