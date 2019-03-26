library(DiceKriging)


### Name: hartman3
### Title: 3D test function
### Aliases: hartman3
### Keywords: optimize internal

### ** Examples
 
design <- matrix(runif(300), 100, 3)
response <- apply(design, 1, hartman3)



