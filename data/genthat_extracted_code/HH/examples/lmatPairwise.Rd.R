library(HH)


### Name: lmatPairwise
### Title: lmatPairwise
### Aliases: lmatPairwise lmatPairwise.matrix lmatPairwise.glht
###   lmatPairwise.mmc.multicomp lmatPairwise.mmc
### Keywords: htest design

### ** Examples

data(catalystm)
catalystm1.aov <- aov(concent ~ catalyst, data=catalystm)
catalystm.mmc <- mmc(catalystm1.aov)
lmatPairwise(catalystm.mmc)



