library(givitiR)


### Name: givitiCalibrationBelt
### Title: Calibration Belt
### Aliases: givitiCalibrationBelt

### ** Examples

#Random by-construction well calibrated model
e <- runif(100)
o <- rbinom(100, size = 1, prob = e)
cb <- givitiCalibrationBelt(o, e, "external")
plot(cb)

#Random by-construction poorly calibrated model
e <- runif(100)
o <- rbinom(100, size = 1, prob = logistic(logit(e)+2))
cb <- givitiCalibrationBelt(o, e, "external")
plot(cb)



