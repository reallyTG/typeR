library(psychotools)


### Name: predict.pcmodel
### Title: Predict Methods for Item Response Models
### Aliases: predict.pcmodel predict.rsmodel predict.raschmodel
###   predict.gpcmodel predict.plmodel
### Keywords: regression

### ** Examples

o <- options(digits = 4)

## load verbal aggression data
data("VerbalAggression", package = "psychotools")

## fit a partial credit model to first ten items
pcmod <- pcmodel(VerbalAggression$resp[, 1:10])

## predicted response probabilities for each subject and category (the default)
head(predict(pcmod), 3)

## predicted mode (most probable category) for certain subjects whose person
## parameters are given via argument "newdata"
predict(pcmod, type = "mode",
  newdata = c("Sarah" = 1.2, "Michael" = 0.1, "Arnd" = -0.8))

## rounded expected category value for the same subjects
predict(pcmod, type = "mean",
  newdata = c("Sarah" = 1.2, "Michael" = 0.1, "Arnd" = -0.8))

## in the Rasch model mode, mean and median are the same
raschmod <- raschmodel(VerbalAggression$resp2[, 1:10])
med <- predict(raschmod, type = "median")
mn <- predict(raschmod, type = "mean")
mod <- predict(raschmod, type = "mode")

head(med, 3)

all.equal(med, mn)
all.equal(mod, mn)

options(digits = o$digits)



