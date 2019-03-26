library(RSNNS)


### Name: art1
### Title: Create and train an art1 network
### Aliases: art1 art1.default

### ** Examples

## Not run: demo(art1_letters)
## Not run: demo(art1_lettersSnnsR)


data(snnsData)
patterns <- snnsData$art1_letters.pat

inputMaps <- matrixToActMapList(patterns, nrow=7)
par(mfrow=c(3,3))
for (i in 1:9) plotActMap(inputMaps[[i]])

model <- art1(patterns, dimX=7, dimY=5)
encodeClassLabels(model$fitted.values)



