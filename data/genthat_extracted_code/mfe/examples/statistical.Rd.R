library(mfe)


### Name: statistical
### Title: Statistical meta-features
### Aliases: statistical statistical.default statistical.formula

### ** Examples

## Extract all meta-features
statistical(Species ~ ., iris)

## Extract some meta-features
statistical(iris[1:4], iris[5], c("cor", "nrNorm"))

## Extract all meta-features without summarize the results
statistical(Species ~ ., iris, summary=c())

## Use another summarization function
statistical(Species ~ ., iris, summary=c("min", "median", "max"))

## Extract statistical measures using by.class approach
statistical(Species ~ ., iris, by.class=TRUE)

## Do not transform the data (using only categorical attributes)
statistical(Species ~ ., iris, transform=FALSE)



