library(DiceOptim)


### Name: hartman4
### Title: 4D test function
### Aliases: hartman4
### Keywords: internal optimize

### ** Examples

design <- matrix(runif(400), 100, 4)
response <- apply(design, 1, hartman4)



