library(spagmix)


### Name: stkey
### Title: Spatiotemporal density generation via keyframe interpolation
### Aliases: stkey

### ** Examples

## No test: 
mn <- matrix(c(0,0,1,2,0.5,-1),nrow=2)
vr <- array(c(0.2,0,0,2,1,0,0,1,1,0.3,0.3,0.5),dim=c(2,2,3))
im1 <- sgmix(mn,c(1,2,1),shp1,p=c(0.4,0.3,0.3))
im2 <- sgmix(matrix(c(-3,0,0,-2,-1,2),nrow=2),c(3,1,1),shp1,p=c(0.4,0.3,0.3))
im3 <- sgmix(mn,vr,shp1,p0=0.1)

kf1 <- stkey(start=im1,stop=im2,tlim=c(5,20),window=shp1)
plot(kf1)

kf2 <- stkey(start=im1,stop=im1,tlim=c(0,15),kf=solist(im1,im1),kftimes=c(2,8),
             fscale=c(1,2,1.5,1),window=shp1)
plot(kf2,fix.range=TRUE)

kf3 <- stkey(start=im1,stop=im2,tlim=c(0,20),kf=solist(im1,im2),kftimes=c(8,12),
             fscale=c(1,2,2,1),window=shp1)
plot(kf3,fix.range=TRUE)

ff <- c(sin((1:64)/3)+1.5)
plot(ff,type="l")
kf4 <- stkey(start=im1,stop=im2,kf=solist(im3),kftimes=25,tlim=c(0,50),fscale=ff,window=shp1)
plot(kf4,fix.range=TRUE)
## End(No test)



