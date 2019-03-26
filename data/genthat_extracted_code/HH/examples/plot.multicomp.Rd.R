library(HH)


### Name: plot.multicomp
### Title: Multiple comparisons plot that gives independent user control
###   over the appearance of the significant and not significant
###   comparisons.
### Aliases: plot.multicomp plot.multicomp.hh plot.multicomp.adjusted
###   plotMatchMMC
### Keywords: dplot

### ** Examples

## data and ANOVA
data(catalystm)

catalystm1.aov <- aov(concent ~ catalyst, data=catalystm)
summary(catalystm1.aov)

catalystm.mca <-
if.R(r=glht(catalystm1.aov, linfct = mcp(catalyst = "Tukey")),
     s=multicomp(catalystm1.aov, plot=FALSE))
if.R(s=plot(catalystm.mca),
     r=plot(confint(catalystm.mca, calpha=qtukey(.95, 4, 12)/sqrt(2))))
       ## calpha is strongly recommended in R with a large number of levels
       ## See ?MMC for details.



