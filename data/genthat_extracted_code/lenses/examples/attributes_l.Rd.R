library(lenses)


### Name: attributes_l
### Title: Attributes lens
### Aliases: attributes_l
### Keywords: datasets

### ** Examples

(x <- structure(1:10, important = "attribute"))
view(x, attributes_l)
set(x, attributes_l, list(important = "feature"))



