library(RoundAndRound)


### Name: Arrow.pcs
### Title: Add arrows in Polar Coordinate System
### Aliases: Arrow.pcs

### ** Examples


x1=PCS2CCS(a=10, ab=1.5)
c1 = ab2c(a=10, ab=1.5)
plot(x1, type='n', xlim=c(-10,10), ylim=c(-10,10), asp=1)
abline(h=0, v=0, asp=1, lty=2)
graphics::lines(x1, col=2);
points(c1, 0, col=2) # focus
Arrow.pcs(theta = 1:12 * 30, r1=0, r2=10, ab1=1.5, length=.1, col=2, o1 = c(c1,0), o2=c(0,0))




