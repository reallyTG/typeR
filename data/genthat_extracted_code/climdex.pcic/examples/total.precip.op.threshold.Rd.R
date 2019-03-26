library(climdex.pcic)


### Name: total.precip.op.threshold
### Title: Sum of precipitation above a threshold
### Aliases: total.precip.op.threshold
### Keywords: climate ts

### ** Examples


prec.dat <- c(0.1, 3.0, 4.3, 1.9, 1.3, 6.0, 0, 0, 4.0, 1)
phony.date.factor <- factor(rep(1:2, each=5))

## Compute equiv of PRCPTOT
prec.sum <- total.precip.op.threshold(prec.dat, phony.date.factor, 1, ">=")




