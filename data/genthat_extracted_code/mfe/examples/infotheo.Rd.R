library(mfe)


### Name: infotheo
### Title: Information-theoretic meta-features
### Aliases: infotheo infotheo.default infotheo.formula

### ** Examples

## Extract all metafeatures
infotheo(Species ~ ., iris)

## Extract some metafeatures
infotheo(iris[1:4], iris[5], c("classEnt", "jointEnt"))

## Extract all meta-features without summarize the results
infotheo(Species ~ ., iris, summary=c())

## Use another summarization functions
infotheo(Species ~ ., iris, summary=c("min", "median", "max"))

## Do not transform the data (using only categorical attributes)
infotheo(Species ~ ., iris, transform=FALSE)



