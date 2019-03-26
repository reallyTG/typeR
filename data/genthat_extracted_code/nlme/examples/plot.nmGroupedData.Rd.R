library(nlme)


### Name: plot.nmGroupedData
### Title: Plot an nmGroupedData Object
### Aliases: plot.nmGroupedData
### Keywords: models

### ** Examples

# no collapsing, panels by Dog
plot(Pixel, display = "Dog", inner = ~Side)
# collapsing by Dog, preserving day
plot(Pixel, collapse = "Dog", preserve = ~day)



