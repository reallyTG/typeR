library(qcc)


### Name: process.capability
### Title: Process capability analysis
### Aliases: process.capability
### Keywords: htest hplot

### ** Examples

data(pistonrings)
attach(pistonrings)
diameter <- qcc.groups(diameter, sample)
q <- qcc(diameter[1:25,], type="xbar", nsigmas=3, plot=FALSE)
process.capability(q, spec.limits=c(73.95,74.05))
process.capability(q, spec.limits=c(73.95,74.05), target=74.02)
process.capability(q, spec.limits=c(73.99,74.01))
process.capability(q, spec.limits = c(73.99, 74.1))



