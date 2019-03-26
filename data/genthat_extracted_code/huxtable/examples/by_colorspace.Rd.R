library(huxtable)


### Name: by_colorspace
### Title: Map numeric cell contents smoothly to colors
### Aliases: by_colorspace

### ** Examples


if (! requireNamespace("scales")) {
  stop("Please install the \"scales\" package to run this example")
}
ht <- as_hux(matrix(rnorm(25), 5, 5))
map_background_color(ht,
      by_colorspace("red", "yellow", "blue"))




