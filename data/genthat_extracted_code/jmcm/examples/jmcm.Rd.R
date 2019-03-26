library(jmcm)


### Name: jmcm
### Title: Fit Joint Mean-Covariance Models
### Aliases: jmcm

### ** Examples

cattleA <- cattle[cattle$group=='A', ]
fit.mcd <- jmcm(weight | id | I(ceiling(day/14 + 1)) ~ 1 | 1,
data=cattleA, triple = c(8, 4, 3), cov.method = 'mcd', 
control = jmcmControl(trace = TRUE, ignore.const.term = FALSE, 
original.poly.order = TRUE))



