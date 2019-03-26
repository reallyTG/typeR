library(nor1mix)


### Name: plot.norMix
### Title: Plotting Methods for 'norMix' Objects
### Aliases: plot.norMix lines.norMix
### Keywords: distribution hplot

### ** Examples

plot(norMix(m=c(0,3), sigma = c(2,1))) # -> var = c(2^2, 1) = c(4, 1)

plot(MW.nm4, p.norm=FALSE, p.comp = TRUE)
plot(MW.nm4, p.norm=FALSE, p.comp = TRUE, ylim = c(0, 2))# now works
stopifnot(all.equal(c(0,2), par("yaxp")[1:2], tol= 1e-15))

## Further examples in  ?norMix and  ?rnorMix



