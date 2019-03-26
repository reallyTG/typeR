library(RSNNS)


### Name: art2
### Title: Create and train an art2 network
### Aliases: art2 art2.default

### ** Examples

## Not run: demo(art2_tetra)
## Not run: demo(art2_tetraSnnsR)


data(snnsData)
patterns <- snnsData$art2_tetra_med.pat

model <- art2(patterns, f2Units=5, learnFuncParams=c(0.99, 20, 20, 0.1, 0), 
                  updateFuncParams=c(0.99, 20, 20, 0.1, 0))
model

testPatterns <- snnsData$art2_tetra_high.pat
predictions <- predict(model, testPatterns)

## Not run: library(scatterplot3d)

## Not run: par(mfrow=c(2,2))
## Not run: scatterplot3d(patterns, pch=encodeClassLabels(model$fitted.values))
## Not run: scatterplot3d(testPatterns, pch=encodeClassLabels(predictions))



