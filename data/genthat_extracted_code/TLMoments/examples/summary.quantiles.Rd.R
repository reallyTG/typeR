library(TLMoments)


### Name: summary.quantiles
### Title: Summary quantiles
### Aliases: summary.quantiles

### ** Examples

x <- cbind(rgev(100, shape = .2), rgev(100, shape = .2))

q <- quantiles(parameters(TLMoments(x[, 1]), "gev"), c(.9, .95, .99))
summary(q)
summary(q, select = c(.9, .99))

q <- quantiles(parameters(TLMoments(x[, 1], rightrim = 1), "gev"), .95)
summary(q)

q <- quantiles(parameters(TLMoments(x), "gev"), c(.9, .95, .99))
summary(q)
summary(q, select = .95)

q <- quantiles(as.parameters(loc = 10, scale = 5, shape = .3, distr = "gev"), c(.9, .99))
summary(q)
summary(q, rightrim = 1, set.n = 250)




