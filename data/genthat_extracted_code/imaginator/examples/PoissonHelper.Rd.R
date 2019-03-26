library(imaginator)


### Name: PoissonHelper
### Title: PoissonHelper
### Aliases: PoissonHelper

### ** Examples


myFuncs <- PoissonHelper(c(10, 20))
myFuncs[[1]](10)
myFuncs[[2]](10)

myFunc <- PoissonHelper(10)
is.function(myFunc)
myFunc(10)

myFunc <- PoissonHelper(10, SingletonList = TRUE)
is.list(myFunc)
myFunc[[1]](10)




