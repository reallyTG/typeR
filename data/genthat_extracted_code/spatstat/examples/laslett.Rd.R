library(spatstat)


### Name: laslett
### Title: Laslett's Transform
### Aliases: laslett
### Keywords: spatial manip

### ** Examples

a <- laslett(heather$coarse)
with(a, clarkevans.test(TanNew[Rect], correction="D", nsim=39))
X <- discs(runifpoint(15) %mark% 0.2, npoly=16)
b <- laslett(X)



