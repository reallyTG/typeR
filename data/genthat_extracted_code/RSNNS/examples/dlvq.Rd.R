library(RSNNS)


### Name: dlvq
### Title: Create and train a dlvq network
### Aliases: dlvq dlvq.default

### ** Examples

## Not run: demo(dlvq_ziff)
## Not run: demo(dlvq_ziffSnnsR)


data(snnsData)
dataset <- snnsData$dlvq_ziff_100.pat

inputs <- dataset[,inputColumns(dataset)]
outputs <- dataset[,outputColumns(dataset)]

model <- dlvq(inputs, outputs)

fitted(model) == outputs
mean(fitted(model) - outputs)



