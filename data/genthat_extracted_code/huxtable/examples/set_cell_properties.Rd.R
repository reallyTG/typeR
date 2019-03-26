library(huxtable)


### Name: set_cell_properties
### Title: Set multiple cell properties
### Aliases: set_cell_properties

### ** Examples

ht <- hux(a = 1:3, b = 1:3)
ht <- set_cell_properties(ht, 1, 1,
      italic = TRUE, text_color = "red")
text_color(ht)
ht



