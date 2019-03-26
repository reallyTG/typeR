library(givitiR)


### Name: givitiCalibrationTestComp
### Title: Computation of the Calibration Test
### Aliases: givitiCalibrationTestComp

### ** Examples

e <- runif(100)
o <- rbinom(100, size = 1, prob = e)
givitiCalibrationTestComp(o, e, "external", .95, 4)



