library(mdatools)


### Name: simcam
### Title: SIMCA multiclass classification
### Aliases: simcam

### ** Examples

## make a multiclass SIMCA model for Iris data
library(mdatools)

# split data 
caldata = iris[seq(1, nrow(iris), 2), 1:4]
se = caldata[1:25, ]
ve = caldata[26:50, ]
vi = caldata[51:75, ]

testdata = iris[seq(2, nrow(iris), 2), 1:4]
testdata.cref = iris[seq(2, nrow(iris), 2), 5]

# create individual models
semodel = simca(se, classname = 'setosa')
semodel = selectCompNum(semodel, 1)

vimodel = simca(vi, classname = 'virginica')
vimodel = selectCompNum(vimodel, 1)

vemodel = simca(ve, classname = 'versicolor')
vemodel = selectCompNum(vemodel, 1)

# combine models into SIMCAM objects, show statistics and plots
model = simcam(list(semodel, vimodel, vemodel), info = 'Iris data')
summary(model)
plot(model)

# show predictions and residuals for calibration data
par(mfrow = c(2, 2))
plotPredictions(model)
plotCooman(model, nc = c(1, 2))
plotResiduals(model, nc = 1)
plotResiduals(model, nc = 2)
par(mfrow = c(1, 1))

# show different plots for the model
par(mfrow = c(2, 2))
plotModelDistance(model, nc = 1)
plotDiscriminationPower(model, nc = c(1, 2))
plotModellingPower(model, nc = 1)
plotModellingPower(model, nc = 2)
par(mfrow = c(1, 1))

# apply the SIMCAM model to test set and show statistics and plots
res = predict(model, testdata, testdata.cref)
summary(res)
plotPredictions(res)




