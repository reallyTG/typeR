library(seminr)


### Name: single_item
### Title: Single-item measurement model specification
### Aliases: single_item

### ** Examples

  mobi_mm <- constructs(
    composite("Image",        multi_items("IMAG", 1:5), weights = correlation_weights),
    composite("Expectation",  multi_items("CUEX", 1:3), weights = mode_A),
    composite("Quality",      multi_items("PERQ", 1:7), weights = regression_weights),
    composite("Value",        single_item("PERV1"), weights = mode_A)
  )



