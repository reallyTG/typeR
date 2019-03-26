library(lenses)


### Name: filter_l
### Title: Filter lens
### Aliases: filter_l

### ** Examples

head(view(iris, filter_l(Species == "setosa"))) # Note Species is not seen
head(over(iris, filter_l(Species == "setosa"), function(x) x + 10))



