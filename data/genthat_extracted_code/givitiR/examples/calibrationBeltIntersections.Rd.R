library(givitiR)


### Name: calibrationBeltIntersections
### Title: Calibration Belt Significant Deviations
### Aliases: calibrationBeltIntersections

### ** Examples

e <- runif(1000)
logite <- logit(e)
eMod <- logistic(logit(e) +  (logit(e))^2)
o <- rbinom(1000, size = 1, prob = eMod)
data <- data.frame(e = e, o = o, logite = logite)

seqP <- seq(from = .01, to =.99, by = .01)
seqG <- logit(seqP)

minMax <- list(min = min(e), max = max(e))

fwLR <- polynomialLogRegrFw(data, .95, 4, 1)
cbBound <- calibrationBeltPoints(data, seqG, fwLR$m, fwLR$fit, .95, .90, "external")
calibrationBeltIntersections(cbBound, seqP, minMax)



