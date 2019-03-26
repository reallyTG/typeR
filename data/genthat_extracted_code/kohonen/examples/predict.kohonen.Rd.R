library(kohonen)


### Name: predict.kohonen
### Title: Predict properties using a trained Kohonen map
### Aliases: predict.kohonen
### Keywords: classif

### ** Examples

data(wines)

training <- sample(nrow(wines), 120)
Xtraining <- scale(wines[training, ])
Xtest <- scale(wines[-training, ],
               center = attr(Xtraining, "scaled:center"),
               scale = attr(Xtraining, "scaled:scale"))
trainingdata <- list(measurements = Xtraining,
                     vintages = vintages[training])
testdata <- list(measurements = Xtest, vintages = vintages[-training])

mygrid = somgrid(5, 5, "hexagonal")
som.wines <- supersom(trainingdata, grid = mygrid)

## ################################################################
## Situation 0: obtain expected values for training data (all layers,
## also if not used in training) on the basis of the position in the map
som.prediction <- predict(som.wines)

## ################################################################
## Situation 1: obtain predictions for all layers used in training

som.prediction <- predict(som.wines, newdata = testdata)
table(vintages[-training], som.prediction$predictions[["vintages"]])


## ################################################################
## Situation 2: obtain predictions for the vintage based on the mapping
## of the sample characteristics only. There are several ways of doing this:

som.prediction <- predict(som.wines, newdata = testdata,
                          whatmap = "measurements")
table(vintages[-training], som.prediction$predictions[["vintages"]])

## same, but now indicated implicitly
som.prediction <- predict(som.wines, newdata = testdata[1])
table(vintages[-training], som.prediction$predictions[["vintages"]])

## if no names are present in the list elements whatmap needs to be
## given explicitly; note that the order of the data layers needs to be
## consistent with the kohonen object
som.prediction <- predict(som.wines, newdata = list(Xtest), whatmap = 1)
table(vintages[-training], som.prediction$predictions[["vintages"]])


## ###############################################################
## Situation 3: predictions for layers not present in the original
## data. Training data need to be provided for those layers.
som.wines <- supersom(Xtraining, grid = mygrid)
som.prediction <- predict(som.wines, newdata = testdata,
                          trainingdata = trainingdata)
table(vintages[-training], som.prediction$predictions[["vintages"]])

## ################################################################
## yeast examples, including NA values

data(yeast)
training.indices <- sample(nrow(yeast$alpha), 300)
training <- rep(FALSE, nrow(yeast$alpha))
training[training.indices] <- TRUE

## unsupervised mapping, based on the alpha layer only. Prediction
## for all layers including alpha
yeast.som <- supersom(lapply(yeast, function(x) subset(x, training)),
                      somgrid(4, 6, "hexagonal"),
                      whatmap = "alpha", maxNA.fraction = .5)
yeast.som.prediction <-
  predict(yeast.som,
          newdata = lapply(yeast, function(x) subset(x, !training)))

table(yeast$class[!training], yeast.som.prediction$prediction[["class"]])

## ################################################################
## supervised mapping - creating the map is now based on both
## alpha and class, prediction for class based on the mapping of alpha.
yeast.som2 <- supersom(lapply(yeast, function(x) subset(x, training)),
                       grid = somgrid(4, 6, "hexagonal"),
                       whatmap = c("alpha", "class"), maxNA.fraction = .5)
yeast.som2.prediction <-
  predict(yeast.som2,
          newdata = lapply(yeast, function(x) subset(x, !training)),
          whatmap = "alpha")
table(yeast$class[!training], yeast.som2.prediction$prediction[["class"]])



