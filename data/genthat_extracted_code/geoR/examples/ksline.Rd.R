library(geoR)


### Name: ksline
### Title: Spatial Prediction - Conventional Kriging
### Aliases: ksline .ksline.aux.1
### Keywords: spatial

### ** Examples

loci <- expand.grid(seq(0,1,l=31), seq(0,1,l=31))
kc <- ksline(s100, loc=loci, cov.pars=c(1, .25))
par(mfrow=c(1,2))
image(kc, main="kriging estimates")
image(kc, val=sqrt(kc$krige.var), main="kriging std. errors")



