library(huxtable)


### Name: set_outer_borders
### Title: Set borders around a rectangle of cells
### Aliases: set_outer_borders set_outer_border_colors
###   set_outer_border_styles

### ** Examples

ht2 <- huxtable(a = 1:3, b = 1:3)
set_outer_borders(ht2, 1)
set_outer_borders(ht2, 2:3, 1:2, 1)

# Problems with colspan:
rowspan(ht2)[2, 1] <- 2
set_outer_borders(ht2, 1:2, 1:2, 1)




