library(givitiR)


### Name: calibrationBeltPoints
### Title: Calibration Belt Confidence Region
### Aliases: calibrationBeltPoints

### ** Examples

e <- runif(100)
logite <- logit(e)
o <- rbinom(100, size = 1, prob = e)
data <- data.frame(e = e, o = o, logite = logite)

seqG <- logit(seq(from = .01, to =.99, by = .01))

fwLR <- polynomialLogRegrFw(data, .95, 4, 1)

calibrationBeltPoints(data, seqG, fwLR$m, fwLR$fit, .95, .90, "external")



