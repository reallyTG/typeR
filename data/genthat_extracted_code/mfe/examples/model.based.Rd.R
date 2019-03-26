library(mfe)


### Name: model.based
### Title: Decision Tree Model Based Meta-features
### Aliases: model.based model.based.default model.based.formula

### ** Examples

## Extract all meta-features using formula
model.based(Species ~ ., iris)

## Extract some meta-features
model.based(iris[1:4], iris[5], c("nodes", "leaves", "treeShape"))

## Use another summarization function
model.based(Species ~ ., iris, summary=c("min", "median", "max"))



