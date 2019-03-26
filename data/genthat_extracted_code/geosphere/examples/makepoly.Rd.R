library(geosphere)


### Name: makePoly
### Title: Add vertices to a polygon or line
### Aliases: makePoly makeLine
### Keywords: methods spatial

### ** Examples

pol <- rbind(c(-180,-20), c(-160,5), c(-60, 0), c(-160,-60), c(-180,-20))
plot(pol)
lines(pol, col='red', lwd=3)
pol2 = makePoly(pol, interval=100000)
lines(pol2, col='blue', lwd=2)



