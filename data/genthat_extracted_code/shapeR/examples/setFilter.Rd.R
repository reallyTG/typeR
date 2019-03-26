library(shapeR)


### Name: setFilter
### Title: Set a filter to analyze the shape data
### Aliases: setFilter

### ** Examples

data(shape)
#Filter only Icelandic and Norwegian samples
shape = setFilter(shape,
getMasterlist(shape, useFilter = FALSE)$pop %in% c("NO","IC"))
table(getMasterlist(shape)$pop)
#Reset filter
shape = setFilter(shape)
table(getMasterlist(shape)$pop)



