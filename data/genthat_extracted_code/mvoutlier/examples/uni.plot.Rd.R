library(mvoutlier)


### Name: uni.plot
### Title: Univariate Presentation of Multivariate Outliers
### Aliases: uni.plot
### Keywords: dplot

### ** Examples

data(swiss)
uni.plot(swiss)
#
# Geostatistical data:
data(humus) # Load humus data
uni.plot(log(humus[, c("As", "Cd", "Co", "Cu", "Mg", "Pb", "Zn")]),symb=TRUE)



