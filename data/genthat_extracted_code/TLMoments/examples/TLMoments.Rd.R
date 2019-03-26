library(TLMoments)


### Name: TLMoments
### Title: Trimmed L-moments
### Aliases: TLMoments TLMoments.numeric TLMoments.matrix TLMoments.list
###   TLMoments.data.frame TLMoments.PWMs TLMoments.parameters

### ** Examples

# Generating data sets:
xmat <- matrix(rnorm(100), nc = 4)
xvec <- xmat[, 3]
xlist <- lapply(1L:ncol(xmat), function(i) xmat[, i])
xdat <- data.frame(
 station = rep(letters[1:2], each = 50),
 season = rep(c("S", "W"), 50),
 hq = as.vector(xmat)
)

# Calculating TL-moments from data:
TLMoments(xvec, leftrim = 0, rightrim = 1)
TLMoments(xmat, leftrim = 1, rightrim = 1)
TLMoments(xlist, max.order = 7)
TLMoments(xdat, hq ~ station, leftrim = 0, rightrim = 2)
TLMoments(xdat, hq ~ season, leftrim = 0, rightrim = 2)
TLMoments(xdat, hq ~ ., leftrim = 0, rightrim = 2)

# Calculating TL-moments from PWMs:
TLMoments(PWMs(xvec))
TLMoments(PWMs(xmat), rightrim = 1)
TLMoments(PWMs(xlist), leftrim = 1, rightrim = 1)
TLMoments(PWMs(xdat, hq ~ station), leftrim = 0, rightrim = 2)
TLMoments(PWMs(xdat, hq ~ station + season), leftrim = 0, rightrim = 2)
TLMoments(as.PWMs(cbind(c(0.12, .41, .38, .33), c(.05, 0.28, .25, .22))), 0, 1)

# Calculating TL-moments from parameters:
(tlm <- TLMoments(xmat, leftrim = 0, rightrim = 1))
TLMoments(parameters(tlm, "gev"))

(tlm <- TLMoments(xdat, hq ~ station, leftrim = 0, rightrim = 2))
TLMoments(parameters(tlm, "gev"))

p <- as.parameters(loc = 3, scale = 2, shape = .4, distr = "gev")
TLMoments(p, rightrim = 1)

p <- as.parameters(cbind(loc = 10, scale = 4, shape = seq(0, .4, .1)), distr = "gev")
TLMoments(p, max.order = 6)

p <- as.parameters(list(
 list(loc = 3, scale = 2, shape = .4),
 list(loc = 3, scale = 2, shape = .2)
), distr = "gev")
TLMoments(p)

p <- as.parameters(data.frame(
 station = letters[1:2],
 loc = c(2, 3),
 scale = c(2, 2),
 shape = c(.4, .2)
), .~station, distr = "gev")
TLMoments(p)



