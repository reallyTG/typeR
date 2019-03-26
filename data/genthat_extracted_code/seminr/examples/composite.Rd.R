library(seminr)


### Name: composite
### Title: Composite construct measurement model specification
### Aliases: composite

### ** Examples

  mobi_mm <- constructs(
    composite("Image",        multi_items("IMAG", 1:5), weights = correlation_weights),
    composite("Expectation",  multi_items("CUEX", 1:3), weights = mode_A),
    composite("Quality",      multi_items("PERQ", 1:7), weights = regression_weights),
    composite("Value",        multi_items("PERV", 1:2), weights = mode_B)
  )



