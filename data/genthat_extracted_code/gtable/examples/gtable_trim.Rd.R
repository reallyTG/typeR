library(gtable)


### Name: gtable_trim
### Title: Trim off empty cells.
### Aliases: gtable_trim

### ** Examples

library(grid)
rect <- rectGrob(gp = gpar(fill = "black"))
base <- gtable(unit(c(2, 2, 2), "cm"), unit(c(2, 2, 2), "cm"))

center <- gtable_add_grob(base, rect, 2, 2)
plot(center)
plot(gtable_trim(center))

col <- gtable_add_grob(base, rect, 1, 2, 3, 2)
plot(col)
plot(gtable_trim(col))

row <- gtable_add_grob(base, rect, 2, 1, 2, 3)
plot(row)
plot(gtable_trim(row))



