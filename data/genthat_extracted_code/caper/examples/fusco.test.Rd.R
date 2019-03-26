library(caper)


### Name: fusco.test
### Title: Imbalance statistics using Fusco and Cronk's method.
### Aliases: fusco.test summary.fusco print.fusco plot.fusco
### Keywords: utilities htest

### ** Examples

data(syrphidae)
syrphidae <- comparative.data(phy=syrphidaeTree, dat=syrphidaeRich, names.col=genus)
summary(fusco.test(syrphidae, rich=nSpp))
summary(fusco.test(syrphidae, tipsAsSpecies=TRUE))
plot(fusco.test(syrphidae, rich=nSpp))



