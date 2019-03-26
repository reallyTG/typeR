library(mfe)


### Name: metafeatures
### Title: Extract meta-features from a dataset
### Aliases: metafeatures metafeatures.default metafeatures.formula

### ** Examples

## Extract all meta-features
metafeatures(Species ~ ., iris)

## Extract some groups of meta-features
metafeatures(iris[1:4], iris[5], c("general", "statistical", "infotheo"))

## Use another summary methods
metafeatures(Species ~ ., iris, summary=c("min", "median", "max"))



