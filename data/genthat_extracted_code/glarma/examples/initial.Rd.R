library(glarma)


### Name: initial
### Title: Initial Parameter Generator for GLARMA from GLM
### Aliases: initial
### Keywords: Initial Parameter Generator

### ** Examples

### Using the polio data
data(Polio)
y <- Polio[, 2]
X <- as.matrix(Polio[, 3:8])

glmMod <- initial(y, X, type = "Poi", alpha=1)
str(glmMod)
head(glmMod)



