library(imbalance)


### Name: mwmote
### Title: Majority weighted minority oversampling technique for imbalance
###   dataset learning
### Aliases: mwmote

### ** Examples

data(iris0)

# Generates new minority examples
newSamples <- mwmote(iris0, numInstances = 100, classAttr = "Class")




