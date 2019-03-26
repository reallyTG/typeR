library(mfe)


### Name: general
### Title: General meta-features
### Aliases: general general.default general.formula

### ** Examples

## Extract all metafeatures
general(Species ~ ., iris)

## Extract some metafeatures
general(iris[1:100, 1:4], iris[1:100, 5], c("nrAttr", "nrClass"))

## Extract all meta-features without summarize prop.class
general(Species ~ ., iris, summary=c())

## Use another summarization functions
general(Species ~ ., iris, summary=c("sd","min","iqr"))



