library(flexCWM)


### Name: cwm
### Title: Fit for the CWM
### Aliases: cwm student.t

### ** Examples

## an exemple with artificial data
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

## an exemple with real data
data("students")
attach(students)
str(students)
# CWM
fit2 <- cwm(WEIGHT ~ HEIGHT + HEIGHT.F , Xnorm = cbind(HEIGHT, HEIGHT.F), 
  k = 2, initialization = "kmeans", modelXnorm = "EEE")
summary(fit2, concomitant = TRUE)
plot(fit2)





