library(DataExplorer)


### Name: dummify
### Title: Dummify discrete features to binary columns
### Aliases: dummify
### Keywords: dummify

### ** Examples

## Dummify iris dataset
str(dummify(iris))

## Dummify diamonds dataset ignoring features with more than 5 categories
data("diamonds", package = "ggplot2")
str(dummify(diamonds, maxcat = 5))
str(dummify(diamonds, select = c("cut", "color")))



