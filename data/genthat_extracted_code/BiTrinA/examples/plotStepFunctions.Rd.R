library(BiTrinA)


### Name: plotStepFunctions
### Title: Plot all step functions for BASC or TASC
### Aliases: plotStepFunctions

### ** Examples

result <- binarize.BASC(iris[,"Petal.Width"], 
                        method="B")
plotStepFunctions(result)

result <- TASC(iris[,"Petal.Width"])
plotStepFunctions(result)



