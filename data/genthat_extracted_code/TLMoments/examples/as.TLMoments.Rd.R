library(TLMoments)


### Name: as.TLMoments
### Title: Convert to TLMoments-object
### Aliases: as.TLMoments as.TLMoments.numeric as.TLMoments.matrix
###   as.TLMoments.list as.TLMoments.data.frame

### ** Examples

### Vector or matrix as input
xmat <- cbind(c(1, .2, .05), c(1, .2, NA), c(1.3, NA, .1))
xvec <- xmat[, 1]
xlist <- lapply(1:ncol(xmat), function(i) xmat[, i])
xdat <- data.frame(
 station = rep(letters[1:3], each = 1),
 season = c("S", "W", "S"),
 L1 = c(1, 1, 1.3),
 L2 = c(.2, .2, .3),
 L3 = c(.05, .04, .1)
)

as.TLMoments(xvec, rightrim = 1)
as.TLMoments(xmat, rightrim = 1)
as.TLMoments(xlist, rightrim = 1)
as.TLMoments(xdat, cbind(L1, L2, L3) ~ station)
as.TLMoments(xdat, .~station+season)
as.TLMoments(xdat, cbind(L1, L2, L3) ~ .)

parameters(as.TLMoments(xvec, rightrim = 0), "gev")
#lmomco::lmom2par(lmomco::vec2lmom(c(1, .2, .25)), "gev")$para

xmat <- cbind(c(NA, .2, -.05), c(NA, .2, .2))
xvec <- xmat[, 1]

as.TLMoments(xvec, ratios = TRUE)
as.TLMoments(xmat, ratios = TRUE)
parameters(as.TLMoments(xvec, ratios = TRUE), "gev")
#lmomco::lmom2par(lmomco::vec2lmom(c(1, .2, -.05)), "gev")$para

xmat <- cbind(c(10, .2, -.05), c(10, .2, .2))
xvec <- xmat[, 1]

as.TLMoments(xvec, ratios = TRUE)
as.TLMoments(xmat, ratios = TRUE)
parameters(as.TLMoments(xvec, ratios = TRUE), "gev")
#lmomco::lmom2par(lmomco::vec2lmom(c(10, .2, -.05)), "gev")$para




