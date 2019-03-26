library(likert)


### Name: reverse.levels
### Title: Reverse the levels of a factor.
### Aliases: reverse.levels

### ** Examples

mylevels <- c('Strongly Disagree', 'Disagree', 'Neither', 'Agree', 'Strongly Agree')
test <- factor(sample(mylevels[1:5], 10, replace=TRUE))
cbind(test, as.integer(test), as.integer(reverse.levels(test)))



