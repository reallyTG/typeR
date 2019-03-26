library(msos)


### Name: pcbic.stepwise
### Title: Choosing a good pattern
### Aliases: pcbic.stepwise

### ** Examples

# Build cars1
require("mclust")
mcars <- Mclust(cars)
cars1 <- cars[mcars$classification==1,]
xcars <- scale(cars1)
eg <- eigen(var(xcars))
pcbic.stepwise(eg$values,95)



