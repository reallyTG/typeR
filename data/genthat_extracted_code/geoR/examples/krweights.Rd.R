library(geoR)


### Name: krweights
### Title: Computes kriging weights
### Aliases: krweights
### Keywords: spatial

### ** Examples

## Figure 8.4 in Webster and Oliver (2001), see help(wo)
attach(wo)
par(mfrow=c(2,2))
plot(c(-10,130), c(-10,130), ty="n", asp=1)
points(rbind(coords, x1))
KC1 <- krige.control(cov.pars=c(0.382,90.53))
w1 <- krweights(wo$coords, loc=x1, krige=KC1)
text(coords[,1], 5+coords[,2], round(w1, dig=3))
##
plot(c(-10,130), c(-10,130), ty="n", asp=1)
points(rbind(coords, x1))
KC2 <- krige.control(cov.pars=c(0.282,90.53), nug=0.1)
w2 <- krweights(wo$coords, loc=x1, krige=KC2)
text(coords[,1], 5+coords[,2], round(w2, dig=3))
##
plot(c(-10,130), c(-10,130), ty="n", asp=1)
points(rbind(coords, x1))
KC3 <- krige.control(cov.pars=c(0.082,90.53), nug=0.3)
w3 <- krweights(wo$coords, loc=x1, krige=KC3)
text(coords[,1], 5+coords[,2], round(w3, dig=3))
##
plot(c(-10,130), c(-10,130), ty="n", asp=1)
points(rbind(coords, x1))
KC4 <- krige.control(cov.pars=c(0,90.53), nug=0.382, micro=0.382)
w4 <- krweights(wo$coords, loc=x1, krige=KC4)
text(coords[,1], 5+coords[,2], round(w4, dig=3))
##
## SK vs OK
##
plot(c(-10,130), c(-10,130), ty="n", asp=1)
points(rbind(coords, x1))
KC5 <- krige.control(cov.pars=c(0.382,50))
w5 <- krweights(wo$coords, loc=x1, krige=KC5)
KC6 <- krige.control(type="sk", beta=2, cov.pars=c(0.382,50))
w6 <- krweights(wo$coords, loc=x1, krige=KC6)
text(coords[,1],  5+coords[,2], round(w5, dig=3))
text(coords[,1], -5+coords[,2], round(w6, dig=3))
##
plot(c(-10,130), c(-10,130), ty="n", asp=1)
points(rbind(coords, x1))
KC7 <- krige.control(cov.pars=c(0.382,0))
w7 <- krweights(wo$coords, loc=x1, krige=KC7)
KC8 <- krige.control(type="sk", beta=2, cov.pars=c(0.382,0))
w8 <- krweights(wo$coords, loc=x1, krige=KC8)
text(coords[,1],  5+coords[,2], round(w7, dig=3))
text(coords[,1], -5+coords[,2], round(w8, dig=3))



