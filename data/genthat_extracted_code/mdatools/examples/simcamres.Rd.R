library(mdatools)


### Name: simcamres
### Title: Results of SIMCA multiclass classification
### Aliases: simcamres

### ** Examples

## make a multiclass SIMCA model for Iris data and apply to test set
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

# combine models into SIMCAM object, show statistics 
model = simcam(list(semodel, vimodel, vemodel), info = 'Iris data')
res = predict(model, testdata, testdata.cref)
summary(res)

# show predicted values
showPredictions(res)

# plot predictions
par(mfrow = c(2, 2))
plotPredictions(res)
plotPredictions(res, nc = 1)
plotPredictions(res, nc = c(1, 2))
plotPredictions(res, show.labels = TRUE)
par(mfrow = c(1, 1))

# show residuals and Cooman's plot

par(mfrow = c(2, 2))
plotCooman(res)
plotCooman(res, nc = c(1, 3))
plotResiduals(res)
plotResiduals(res, nc = 3)
par(mfrow = c(1, 1))




