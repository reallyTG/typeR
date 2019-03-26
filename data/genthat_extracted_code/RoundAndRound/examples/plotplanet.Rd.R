library(RoundAndRound)


### Name: plotplanet
### Title: Plot a planet
### Aliases: plotplanet

### ** Examples


a = 10;
ab=1.5
x1=PCS2CCS(a=a, ab=ab)
c1 = ab2c(a=a, ab=ab)
plot(x1, type='l', xlim=c(-10,10), ylim=c(-10,10), asp=1, col='gray')
Arrow.pcs(theta = 1:12 * 30, r1=0, r2=a, ab1=ab, length=.1, col=2, o1 = c(c1,0), o2=c(0,0))
pos = PCS2CCS(theta = 1:12 * 30, a=a, ab=ab)
plotplanet(orig = pos, arrow.len=0.1)




