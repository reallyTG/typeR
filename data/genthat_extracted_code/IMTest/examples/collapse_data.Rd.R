library(IMTest)


### Name: collapse_data
### Title: Collapses data for a given collapsing function
### Aliases: collapse_data

### ** Examples

data(dataset)
collapse = split(rep(c(1:4), 10), rep(1:10, each = 4))
my_data = collapse_data(dataset, collapse, "rasch")
# See vignette("IMT-vignette") for more examples.



