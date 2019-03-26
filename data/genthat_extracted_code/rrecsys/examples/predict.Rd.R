library(rrecsys)


### Name: predict
### Title: Generate predictions.
### Aliases: predict predict,BPRclass-method predict,IBclass-method
###   predict,UBclass-method predict,algAverageClass-method
###   predict,SVDclass-method predict,wALSclass-method 'predict,
###   slopeOneclass'

### ** Examples


data("mlLatest100k")

smallMl <- mlLatest100k[1:50, 1:100]

exExpl <- defineData(smallMl)

model1exp <- rrecsys(exExpl, alg = "funk", k = 10, learningRate = 0.01, regCoef = 0.001)

pre1 <- predict(model1exp, Round = TRUE) 



