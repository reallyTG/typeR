library(liquidSVM)


### Name: clean.liquidSVM
### Title: Force to release the internal memory of the C++ objects
###   associated to this model.
### Aliases: clean.liquidSVM clean

### ** Examples

## Multiclass classification
modelIris <- svm(Species ~ ., iris)
y <- predict(modelIris, iris)

## Least Squares
modelTrees <- svm(Height ~ Girth + Volume, trees)
y <- predict(modelTrees, trees)
plot(trees$Height, y)
test(modelTrees, trees)

clean(modelTrees)
clean(modelIris)
# now predict(modelTrees, ...) would not be possible any more



