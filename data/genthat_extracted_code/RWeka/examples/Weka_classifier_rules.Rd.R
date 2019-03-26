library(RWeka)


### Name: Weka_classifier_rules
### Title: R/Weka Rule Learners
### Aliases: Weka_classifier_rules JRip M5Rules OneR PART
### Keywords: models regression classif

### ** Examples

M5Rules(mpg ~ ., data = mtcars)

m <- PART(Species ~ ., data = iris)
m
summary(m)



