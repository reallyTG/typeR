library(TLMoments)


### Name: plot.TLMoments
### Title: L-Moment-ratio diagram
### Aliases: plot.TLMoments

### ** Examples

## Not run: 
##D xmat <- matrix(rgev(1000, shape = .3), nc = 10)
##D xvec <- xmat[, 3]
##D xlist <- lapply(1L:ncol(xmat), function(i) xmat[, i])
##D xdat <- data.frame(
##D  station = rep(letters[1:10], each = 100),
##D  season = rep(c("S", "W"), 50),
##D  hq = as.vector(xmat)
##D )
##D 
##D library(ggplot2)
##D plot(TLMoments(xvec))
##D plot(TLMoments(xlist), distr = c("gev", "gum"))
##D plot(TLMoments(xmat), distr = "only-points")
##D plot(TLMoments(xmat), distr = "only-lines") + scale_colour_viridis_d()
##D plot(TLMoments(xmat, 0, 1))
##D plot(TLMoments(xmat, 0, 1)) + coord_cartesian(xlim = c(-.05, .4), ylim = c(.05, .2))
##D plot(TLMoments(xdat, hq ~ station, 1, 0))
## End(Not run)



