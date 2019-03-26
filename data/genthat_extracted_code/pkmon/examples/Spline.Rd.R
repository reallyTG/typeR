library(pkmon)


### Name: Spline
### Title: Random generation and distribution function of k-monotone
###   densities
### Aliases: rSpline dSpline rmixSpline dmixSpline

### ** Examples

x=rSpline(n=100, 20, 3)
p=dSpline(20, 3)
xmix=rmixSpline(n=100, c(5, 20), 3, c(0.5, 0.5))
pmix=dmixSpline(c(5, 20), 3, c(0.5, 0.5))
par(mfrow=c(1, 2))
hist(x, freq=FALSE)
lines(p, col="red")
hist(xmix, freq=FALSE)
lines(pmix, col="red")



