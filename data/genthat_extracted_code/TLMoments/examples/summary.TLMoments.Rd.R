library(TLMoments)


### Name: summary.TLMoments
### Title: Summary TLMoments
### Aliases: summary.TLMoments

### ** Examples

tlm <- TLMoments(rgev(100, shape = .2))
summary(tlm)

tlm <- TLMoments(rgev(100, shape = .2), rightrim = 1)
summary(tlm, select = 3:4)

tlm <- TLMoments(rgev(100, shape = .2), max.order = 2, rightrim = 1)
summary(tlm)

tlm <- TLMoments(matrix(rgev(100, shape = .2), nc = 2))
summary(tlm, select = 3:4)

tlm <- TLMoments(matrix(rgev(100, shape = .2), nc = 2), max.order = 3)
summary(tlm, ci = .95, distr = "gev")

tlm <- as.TLMoments(c(15, 5, 1.3))
summary(tlm, distr = "gev", set.n = 100)




