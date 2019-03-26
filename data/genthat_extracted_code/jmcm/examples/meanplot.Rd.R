library(jmcm)


### Name: meanplot
### Title: Plot Fitted Mean Curves
### Aliases: meanplot

### ** Examples

cattleA <- cattle[cattle$group=='A', ]
fit.mcd <- jmcm(weight | id | I(ceiling(day/14 + 1)) ~ 1 | 1, data=cattleA,
  triple = c(8, 3, 4), cov.method = 'mcd')
meanplot(fit.mcd)




