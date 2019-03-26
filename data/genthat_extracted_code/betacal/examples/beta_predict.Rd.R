library(betacal)


### Name: beta_predict
### Title: Predict Calibrated Probabilities
### Aliases: beta_predict

### ** Examples

## Creating a vector of probabilities
p <- seq(0.01,0.99,0.01)

## Creating a label vector based on the probability vector
y <- rbinom(99,1,p)

## Fitting beta calibration with three parameters
calib <- beta_calibration(p, y, "abm")

## Obtaining calibrated probabilities
probas <- beta_predict(p, calib)



