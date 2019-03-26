library(RoundAndRound)


### Name: PCS2CCS
### Title: Convert Polar Coordinate System to Cartesian Coordinate System.
### Aliases: PCS2CCS

### ** Examples

x1=PCS2CCS(a=10, ab=1.5)
x2=PCS2CCS(a=9, ab=1.2)
c1 = ab2c(a=10, ab=1.5)
c2 = ab2c(a=9, ab=1.2)

plot(x1, type='n', xlim=c(-10,10), ylim=c(-10,10), asp=1)
abline(h=0, v=0, asp=1, lty=2)
lines(x1, col=2);
points(c1, 0, col=2)
lines(x2, col=3);
points(c2, 0, col=3)

# Test 2
x1=PCS2CCS(a=10, ab=1.5, clockwise = FALSE, rotation=0);
x2=PCS2CCS(a=8, ab=1.5, clockwise = FALSE, rotation=45);
plot(x1, asp=1, col=terrain.colors(nrow(x1)), pch=19)
points(x2, asp=1, col=terrain.colors(nrow(x1)))




