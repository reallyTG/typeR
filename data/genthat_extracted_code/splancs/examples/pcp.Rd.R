library(splancs)


### Name: pcp
### Title: Fit a Poisson cluster process
### Aliases: pcp
### Keywords: spatial

### ** Examples

data(cardiff)
polymap(cardiff$poly)
pointmap(as.points(cardiff), add=TRUE)
title("Locations of homes of 168 juvenile offenders")
pcp.fit <- pcp(as.points(cardiff), cardiff$poly, h0=30, n.int=30)
pcp.fit



