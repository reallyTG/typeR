library(CORElearn)


### Name: regDataGen
### Title: Artificial data for testing regression algorithms
### Aliases: regDataGen
### Keywords: data datagen

### ** Examples

#prepare a regression data set
regData <-regDataGen(noInst=200)

# build regression tree similar to CART
modelRT <- CoreModel(response ~ ., regData, model="regTree", modelTypeReg=1)
print(modelRT)

destroyModels(modelRT) # clean up




