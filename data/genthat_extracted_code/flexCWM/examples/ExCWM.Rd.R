library(flexCWM)


### Name: ExCWM
### Title: dataset ExCWM
### Aliases: ExCWM
### Keywords: datasets

### ** Examples

data("ExCWM")
attach(ExCWM)
str(ExCWM)

# mixtures of binomial distributions
resXbin <- cwm(Xbin = Xbin, k = 1:2, initialization = "kmeans")
getParXbin(resXbin)

# Mixtures of Poisson distributions
resXpois <- cwm(Xpois = Xpois, k = 1:2, initialization = "kmeans")
getParXpois(resXpois)

# parsimonious mixtures of multivariate normal distributions
resXnorm <- cwm(Xnorm = cbind(Xnorm1,Xnorm2), k = 1:2, initialization = "kmeans")
getParXnorm(resXnorm)





