library(GEOmap)


### Name: pgon
### Title: Plot regular polygon: pentagon, hexagon, octagon
### Aliases: pgon
### Keywords: aplot

### ** Examples


N = 25
x = rnorm(N)
y = rnorm(N)

z = rnorm(N)

######## draw pentagons
plot(x,y, type='n', axes=FALSE, ann=FALSE)
pgon(x,y, siz=abs(z)/10, col="white", border='black', startalph =60, K=5, lwd=.5, xpd=TRUE)

######   color the points, use 4-sided blocks
rbow=rainbow(100)

ss = sample(1:100, N, replace = TRUE, prob = NULL)
plot(x,y, type='n', axes=FALSE, ann=FALSE)
pgon(x,y, siz=abs(z)/10, col=rbow[ss], border='black', startalph =60, K=4, lwd=.5, xpd=TRUE)







