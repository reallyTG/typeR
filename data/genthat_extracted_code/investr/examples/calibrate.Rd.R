library(investr)


### Name: calibrate
### Title: Calibration for the simple linear regression model.
### Aliases: calibrate calibrate.default calibrate.formula calibrate.lm
###   print.calibrate

### ** Examples

#
# Arsenic example (simple linear regression with replication)
#

# Inverting a prediction interval for an individual response
arsenic.lm <- lm(measured ~ actual, data = arsenic)
plotFit(arsenic.lm, interval = "prediction", shade = TRUE, 
        col.pred = "lightblue")
(cal <- calibrate(arsenic.lm, y0 = 3, interval = "inversion"))
abline(h = 3)
segments(cal$estimate, 3, cal$estimate, par()$usr[3])
arrows(cal$lower, 3, cal$lower, par()$usr[3])
arrows(cal$upper, 3, cal$upper, par()$usr[3])

#
# Crystal weight example (simple linear regression)
#

# Inverting a confidence interval for the mean response
crystal.lm <- lm(weight ~ time, data = crystal)
plotFit(crystal.lm, interval = "confidence", shade = TRUE,
        col.conf = "lightblue")
(cal <- calibrate(crystal.lm, y0 = 8, interval = "inversion", 
                  mean.response = TRUE))
abline(h = 8)
segments(cal$estimate, 8, cal$estimate, par()$usr[3])
arrows(cal$lower, 8, cal$lower, par()$usr[3])
arrows(cal$upper, 8, cal$upper, par()$usr[3])

# Wald interval and approximate standard error based on the delta method
calibrate(crystal.lm, y0 = 8, interval = "Wald", mean.response = TRUE)



