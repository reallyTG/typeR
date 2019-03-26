library(msos)


### Name: pcbic
### Title: BIC for a particular pattern Find the BIC and MLE from a set of
###   observed eigenvalues for a specific pattern.
### Aliases: pcbic

### ** Examples

# Build cars1
require("mclust")
mcars <- Mclust(cars)
cars1 <- cars[mcars$classification==1,]
xcars <- scale(cars1)
eg <- eigen(var(xcars))
pcbic(eg$values, 95, c(1, 1, 3, 3, 2, 1))



