library(reliaR)


### Name: BurrX
### Title: The BurrX (Generalized Rayleigh) distribution
### Aliases: BurrX dburrX pburrX qburrX rburrX
### Keywords: distribution

### ** Examples

## Load data sets
data(bearings)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.1989515, lambda.est = 0.0130847

dburrX(bearings, 1.1989515, 0.0130847, log = FALSE)
pburrX(bearings, 1.1989515, 0.0130847, lower.tail = TRUE, log.p = FALSE)
qburrX(0.25, 1.1989515, 0.0130847, lower.tail=TRUE, log.p = FALSE)
rburrX(30, 1.1989515, 0.0130847)



