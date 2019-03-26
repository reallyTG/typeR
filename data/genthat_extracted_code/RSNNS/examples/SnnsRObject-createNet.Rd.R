library(RSNNS)


### Name: SnnsRObject$createNet
### Title: Create a layered network
### Aliases: SnnsRObject$createNet SnnsR__createNet createNet,SnnsR-method

### ** Examples

obj1 <- SnnsRObjectFactory()
obj1$createNet(c(2,2), FALSE)
obj1$getUnitDefinitions()

obj2 <- SnnsRObjectFactory()
obj2$createNet(c(8,5,5,2), TRUE)
obj2$getUnitDefinitions()



