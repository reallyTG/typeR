library(mfe)


### Name: landmarking
### Title: Landmarking Meta-features
### Aliases: landmarking landmarking.default landmarking.formula

### ** Examples

## Extract all meta-features using formula
landmarking(Species ~ ., iris)

## Extract some meta-features
landmarking(iris[1:4], iris[5], c("bestNode", "randomNode", "worstNode"))

## Use another summarization function
landmarking(Species ~ ., iris, summary=c("min", "median", "max"))

## Use 2 folds and balanced accuracy
landmarking(Species ~ ., iris, folds=2, score="balanced.accuracy")



