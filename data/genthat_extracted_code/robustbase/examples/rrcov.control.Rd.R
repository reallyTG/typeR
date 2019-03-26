library(robustbase)


### Name: rrcov.control
### Title: Control Settings for covMcd and ltsReg
### Aliases: rrcov.control
### Keywords: robust multivariate

### ** Examples

data(Animals, package = "MASS")
brain <- Animals[c(1:24, 26:25, 27:28),]
data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])

ctrl <- rrcov.control(alpha=0.75, trace=TRUE)
covMcd(hbk.x,      control = ctrl)
covMcd(log(brain), control = ctrl)



