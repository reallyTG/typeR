library(RSNNS)


### Name: assoz
### Title: Create and train an (auto-)associative memory
### Aliases: assoz assoz.default

### ** Examples

## Not run: demo(assoz_letters)
## Not run: demo(assoz_lettersSnnsR)


data(snnsData)
patterns <- snnsData$art1_letters.pat

model <- assoz(patterns, dimX=7, dimY=5)

actMaps <- matrixToActMapList(model$fitted.values, nrow=7)

par(mfrow=c(3,3))
for (i in 1:9) plotActMap(actMaps[[i]])



