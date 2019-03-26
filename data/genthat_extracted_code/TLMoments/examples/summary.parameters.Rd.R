library(TLMoments)


### Name: summary.parameters
### Title: Summary parameters
### Aliases: summary.parameters

### ** Examples

x <- cbind(rgev(100, shape = .2), rgev(100, shape = .2))

p <- parameters(TLMoments(x[, 1]), "gev")
summary(p)
summary(p, select = c("scale", "shape"))

p <- parameters(TLMoments(x[, 1], rightrim = 1), "gev")
summary(p)

p <- parameters(TLMoments(x), "gev")
summary(p)
summary(p, select = "shape")

p <- as.parameters(loc = 10, scale = 5, shape = .3, distr = "gev")
summary(p)
summary(p, rightrim = 1, set.n = 250)




