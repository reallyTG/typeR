library(huxtable)


### Name: by_rows
### Title: Set cell properties by row or column
### Aliases: by_rows by_cols

### ** Examples

ht <- as_hux(matrix(rnorm(25), 5, 5))
map_background_color(ht,
      by_rows("green", "grey"))
map_background_color(ht,
      by_cols("green", "grey"))



