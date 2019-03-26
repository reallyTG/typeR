library(HH)


### Name: mmcplot
### Title: MMC (Mean-mean Multiple Comparisons) plots in lattice.
### Aliases: mmcplot mmcplot.mmc mmcplot.glht mmcplot.mmc.multicomp
###   mmcplot.multicomp mmcplot.default
### Keywords: hplot

### ** Examples

data(catalystm)
catalystm1.aov <- aov(concent ~ catalyst, data=catalystm)
catalystm.mmc <-
   mmc(catalystm1.aov, linfct = mcp(catalyst = "Tukey"))
mmcplot(catalystm.mmc)
mmcplot(catalystm.mmc, style="both", MMCname="catalyst")



