library(FSA)


### Name: compSlopes
### Title: Tests for significant differences among all pairs of slopes in a
###   dummy variable regression (DVR).
### Aliases: compSlopes print.compSlopes
### Keywords: htest

### ** Examples

Mirex$year <- factor(Mirex$year)
# fit a dummy variable regression, see that slopes differ
lm1 <- lm(mirex~weight*year,data=Mirex)
anova(lm1)
# compare all pairs of slopes using default Holm control
compSlopes(lm1)
# compare all pairs of slopes using the false discovery rate control
compSlopes(lm1,method="fdr")
# visualize the results
fitPlot(lm1)




