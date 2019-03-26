library(robustbase)


### Name: summary.mcd
### Title: Summary Method for MCD objects
### Aliases: summary.mcd print.summary.mcd
### Keywords: multivariate robust

### ** Examples

data(Animals, package = "MASS")
brain <- Animals[c(1:24, 26:25, 27:28),]
lbrain <- log(brain)
summary(cLB <- covMcd(lbrain))



