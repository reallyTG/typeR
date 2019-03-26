library(virtualspecies)


### Name: betaFun
### Title: Beta response function
### Aliases: betaFun

### ** Examples

temp <- seq(-10, 40, length = 100)
# A curve similar to a thermal performance curve
P <- betaFun(x = temp, p1 = 0, p2 = 35, alpha = 0.9, gamma = 0.08)
plot(P ~ temp, type = "l")



