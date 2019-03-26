library(PMCMRplus)


### Name: GSTTest
### Title: Generalized Siegel-Tukey Test of Homogeneity of Scales
### Aliases: GSTTest GSTTest.default GSTTest.formula
### Keywords: htest nonparametric

### ** Examples

GSTTest(count ~ spray, data = InsectSprays)

## as means/medians differ, apply the test to residuals
## of one-way ANOVA
ans <- aov(count ~ spray, data = InsectSprays)
GSTTest( residuals( ans) ~ spray, data =InsectSprays)




