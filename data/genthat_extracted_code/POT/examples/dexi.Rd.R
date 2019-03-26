library(POT)


### Name: dexi
### Title: Compute the Density of the Extremal Index
### Aliases: dexi
### Keywords: models

### ** Examples

mc <- simmc(100, alpha = 0.25)
mc <- qgpd(mc, 0, 1, 0.25)
log <- fitmcgpd(mc, 2, shape = 0.25, scale = 1)
dexi(log, n.sim = 100)



