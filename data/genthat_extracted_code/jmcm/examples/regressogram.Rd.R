library(jmcm)


### Name: regressogram
### Title: Plot Sample Regressograms and Fitted Curves
### Aliases: regressogram

### ** Examples

cattleA <- cattle[cattle$group=='A', ]
fit.mcd <- jmcm(weight | id | I(ceiling(day/14 + 1)) ~ 1 | 1, data=cattleA,
  triple = c(8, 3, 4), cov.method = 'mcd')
regressogram(fit.mcd, time = 1:11)




