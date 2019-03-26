library(boostr)


### Name: isClassConstructor
### Title: check if a function is a(n S3) class constructor
### Aliases: isClassConstructor

### ** Examples

isClassConstructor(mean) # FALSE

# simple output
library(randomForest)
isClassConstructor(randomForest) # TRUE

# complicated output (multiple values in "classes")
isClassConstructor(glm) # TRUE
isClassConstructor(lm) # TRUE



