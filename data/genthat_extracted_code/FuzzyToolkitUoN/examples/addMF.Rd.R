library(FuzzyToolkitUoN)


### Name: addMF
### Title: Insert a membership function.
### Aliases: addMF
### Keywords: "addMF"

### ** Examples

MF <<- gaussMF("myMF", 0:10, c(1.5,5,1))
FIS <<- newFIS("MyFIS")
FIS <<- addVar(FIS, "input", "variableName", 0:10)
FIS <<- addMF(FIS, "input", 1, MF)



