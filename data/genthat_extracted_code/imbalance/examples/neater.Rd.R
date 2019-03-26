library(imbalance)


### Name: neater
### Title: Fitering of oversampled data based on non-cooperative game
###   theory
### Aliases: neater

### ** Examples

data(iris0)

newSamples <- smotefamily::SMOTE(iris0[,-5], iris0[,5])$syn_data
# SMOTE overrides Class attr turning it into class
# and dataset must have same class attribute as newSamples
names(newSamples) <- c(names(newSamples)[-5], "Class")

neater(iris0, newSamples, k = 5, iterations = 100,
       smoothFactor = 1, classAttr = "Class")



