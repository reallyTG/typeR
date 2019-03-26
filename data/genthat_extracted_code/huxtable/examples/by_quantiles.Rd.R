library(huxtable)


### Name: by_quantiles
### Title: Map numeric quantiles to cell properties
### Aliases: by_quantiles by_equal_groups

### ** Examples

ht <- hux(rnorm(5), rnorm(5))

map_background_color(ht,
      by_quantiles(
        c(0.2, 0.8),
        c("red", "white", "green")
      ))

map_background_color(ht,
      by_equal_groups(
        3,
        c("red", "yellow", "green")
      ))



