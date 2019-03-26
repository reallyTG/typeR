library(huxtable)


### Name: by_ranges
### Title: Map numeric ranges to cell properties
### Aliases: by_ranges

### ** Examples

ht <- huxtable(c(1, 3, 5))
map_background_color(ht,
      by_ranges(
        c(2, 4),
        c("red", "yellow", "blue")
      ))

map_background_color(ht,
      by_ranges(
        c(2, 4),
        "pink",
        extend = FALSE
      ))

map_background_color(ht,
      by_ranges(
        c(1, 5),
        c("red", "yellow", "green"),
        right = TRUE
      ))
map_background_color(ht,
      by_ranges(
        c(1, 5),
        c("red", "yellow", "green"),
        right = FALSE
      ))



