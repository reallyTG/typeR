library(huxtable)


### Name: by_values
### Title: Map specific cell values to cell properties
### Aliases: by_values

### ** Examples

ht <- hux(letters[1:3])
map_background_color(ht,
      by_values(a = "red", c = "yellow"))
map_background_color(ht,
      by_values(a = "red", c = "yellow", "green"))



