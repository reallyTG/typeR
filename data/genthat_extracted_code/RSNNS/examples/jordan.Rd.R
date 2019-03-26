library(RSNNS)


### Name: jordan
### Title: Create and train a Jordan network
### Aliases: jordan jordan.default

### ** Examples

## Not run: demo(iris)
## Not run: demo(laser)
## Not run: demo(eight_elman)
## Not run: demo(eight_elmanSnnsR)


data(snnsData)
inputs <- snnsData$laser_1000.pat[,inputColumns(snnsData$laser_1000.pat)]
outputs <- snnsData$laser_1000.pat[,outputColumns(snnsData$laser_1000.pat)]

patterns <- splitForTrainingAndTest(inputs, outputs, ratio=0.15)

modelJordan <- jordan(patterns$inputsTrain, patterns$targetsTrain, 
                       size=c(8), learnFuncParams=c(0.1), maxit=100,
                       inputsTest=patterns$inputsTest, 
                       targetsTest=patterns$targetsTest, linOut=FALSE)

names(modelJordan)

par(mfrow=c(3,3))
plotIterativeError(modelJordan)

plotRegressionError(patterns$targetsTrain, modelJordan$fitted.values)
plotRegressionError(patterns$targetsTest, modelJordan$fittedTestValues)
hist(modelJordan$fitted.values - patterns$targetsTrain, col="lightblue")

plot(inputs, type="l")
plot(inputs[1:100], type="l")
lines(outputs[1:100], col="red")
lines(modelJordan$fitted.values[1:100], col="green")



