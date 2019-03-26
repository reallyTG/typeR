library(givitiR)


### Name: givitiCalibrationTest
### Title: Calibration Test
### Aliases: givitiCalibrationTest

### ** Examples

#Random by-construction well calibrated model
e <- runif(100)
o <- rbinom(100, size = 1, prob = e)
givitiCalibrationTest(o, e, "external")

#Random by-construction poorly calibrated model
e <- runif(100)
o <- rbinom(100, size = 1, prob = logistic(logit(e)+2))
givitiCalibrationTest(o, e, "external")



