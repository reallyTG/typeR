library(betacal)


### Name: beta_calibration
### Title: Beta Calibration
### Aliases: beta_calibration

### ** Examples

## Creating a vector of probabilities
p <- seq(0.01,0.99,0.01)

## Creating a label vector based on the probability vector
y <- rbinom(99,1,p)

## Fitting beta calibration with three parameters
calib <- beta_calibration(p, y, "abm")

## Fitting beta calibration with two shape parameters
calib <- beta_calibration(p, y, "ab")

## Fitting beta calibration with one shape parameter and one location parameter
calib <- beta_calibration(p, y, "am")



