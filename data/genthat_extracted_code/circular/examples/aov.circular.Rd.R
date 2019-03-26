library(circular)


### Name: aov.circular
### Title: Analysis of Variance for circular data
### Aliases: aov.circular print.aov.circular
### Keywords: models

### ** Examples

x <- c(rvonmises(50, circular(0), 1), rvonmises(100, circular(pi/3), 10))
group <- c(rep(0, 50), rep(1, 100))

aov.circular(x, group)
aov.circular(x, group, method="LRT")



