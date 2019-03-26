library(TLMoments)


### Name: parameters
### Title: Converting TL-moments to distribution parameters
### Aliases: parameters

### ** Examples

xmat <- matrix(rgev(100, shape = .2), nc = 4)
xvec <- xmat[, 3]
xlist <- lapply(1L:ncol(xmat), function(i) xmat[, i])
xdat <- data.frame(
 station = rep(letters[1:2], each = 50),
 season = rep(c("S", "W"), 50),
 hq = as.vector(xmat)
)

tlm <- TLMoments(xvec, leftrim = 0, rightrim = 0)
parameters(tlm, "gev")

tlm <- TLMoments(xmat, leftrim = 1, rightrim = 1)
parameters(tlm, "gum")

tlm <- TLMoments(xlist)
parameters(tlm, "gpd")

tlm <- TLMoments(xdat, hq ~ station, leftrim = 0, rightrim = 2)
parameters(tlm, "gev")

tlm <- TLMoments(xdat, hq ~ station + season, leftrim = 0, rightrim = 2)
parameters(tlm, "gev")

tlm <- TLMoments(xdat, hq ~ station + season, leftrim = 0, rightrim = 2)
parameters(tlm, "ln3")


# Numerical calculation

tlm <- TLMoments(rgum(200, loc = 5, scale = 2), leftrim = 1, rightrim = 4)
parameters(tlm, "gum")

tlm <- TLMoments(rgev(200, loc = 10, scale = 5, shape = .4), leftrim = 2, rightrim = 2)
parameters(tlm, "gev")

tlm <- TLMoments(rln3(200, loc = 3, scale = 1.5, shape = 2), leftrim = 0, rightrim = 1)
parameters(tlm, "ln3")

# It's A LOT slower:
## Not run: 
##D system.time(replicate(500,
##D   parameters(TLMoments(rgum(100, loc = 5, scale = 2), 1, 1), "gum")
##D ))[3]
##D system.time(replicate(500,
##D   parameters(TLMoments(rgum(100, loc = 5, scale = 2), 1, 2), "gum")
##D ))[3]
## End(Not run)

# Using magrittr
library(magrittr)

TLMoments(rgpd(500, loc = 10, scale = 3, shape = .3), rightrim = 0) %>%
 parameters("gpd")

TLMoments(rgpd(500, loc = 10, scale = 3, shape = .3), rightrim = 0) %>%
 parameters("gpd", u = 10)

TLMoments(rgpd(500, loc = 10, scale = 3, shape = .3), rightrim = 1) %>%
 parameters("gpd")

TLMoments(rgpd(500, loc = 10, scale = 3, shape = .3), rightrim = 2) %>%
 parameters("gpd")




