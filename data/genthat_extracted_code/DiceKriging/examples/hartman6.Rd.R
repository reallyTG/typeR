library(DiceKriging)


### Name: hartman6
### Title: 6D test function
### Aliases: hartman6
### Keywords: optimize internal

### ** Examples
 
design <- matrix(runif(600), 100, 6)
response <- apply(design, 1, hartman6)



