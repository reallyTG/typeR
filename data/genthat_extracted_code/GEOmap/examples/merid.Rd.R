library(GEOmap)


### Name: merid
### Title: Orthogonal Projection of Meridian or Parallel
### Aliases: merid paral
### Keywords: misc

### ** Examples


 olat = 0
         olon = 0

          tlat = 23
         tlon = 30

M = merid(tlon, lat1=tlat, olon, olat, 1)


R = 1

phi1=40


GLOBE.ORTH(20, phi1, 1,plotmap=FALSE)

M1 = merid(20, lat1=20, lat2=40, phi1=phi1, lam0=olat, R=1, by=1)

P2 = paral(40, lon1=20 , lon2=40, lam0=olat, phi1=phi1, R=1, by=1)

M2 = merid(40, lat1=40, lat2=20, phi1=phi1, lam0=olat, R=1, by=1)

P1 = paral(20, lon1=40 , lon2=20, lam0=olat, phi1=phi1, R=1, by=1)

polygon(c(M1$x, P2$x, M2$x, P1$x), c(M1$y, P2$y, M2$y, P1$y),
col=rgb(.8, .8, 1))





