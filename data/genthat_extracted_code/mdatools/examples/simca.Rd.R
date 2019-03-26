library(mdatools)


### Name: simca
### Title: SIMCA one-class classification
### Aliases: simca

### ** Examples

## make a SIMCA model for Iris setosa class with full cross-validation
library(mdatools)

data = iris[, 1:4]
class = iris[, 5]

# take first 20 objects of setosa as calibration set 
se = data[1:20, ]

# make SIMCA model and apply to test set
model = simca(se, 'setosa', cv = 1)
model = selectCompNum(model, 1)

# show infromation, summary and plot overview
print(model)
summary(model)
plot(model)

# show predictions 
par(mfrow = c(2, 1))
plotPredictions(model, show.labels = TRUE)
plotPredictions(model, res = 'calres', ncomp = 2, show.labels = TRUE)
par(mfrow = c(1, 1))

# show performance, modelling power and residuals for ncomp = 2
par(mfrow = c(2, 2))
plotSensitivity(model)
plotMisclassified(model)
plotModellingPower(model, ncomp = 2, show.labels = TRUE)
plotResiduals(model, ncomp = 2)
par(mfrow = c(1, 1))




