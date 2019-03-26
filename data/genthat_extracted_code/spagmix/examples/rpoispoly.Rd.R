library(spagmix)


### Name: rpoispoly
### Title: Generate a Poisson point pattern in a polygonal window
### Aliases: rpoispoly

### ** Examples

mn <- cbind(c(0.25,0.8),c(0.31,0.82),c(0.43,0.64),c(0.63,0.62),c(0.21,0.26))
v1 <- matrix(c(0.0023,-0.0009,-0.0009,0.002),2)
v2 <- matrix(c(0.0016,0.0015,0.0015,0.004),2)
v3 <- matrix(c(0.0007,0.0004,0.0004,0.0011),2)
v4 <- matrix(c(0.0023,-0.0041,-0.0041,0.0099),2)
v5 <- matrix(c(0.0013,0.0011,0.0011,0.0014),2)
vr <- array(NA,dim=c(2,2,5))
for(i in 1:5) vr[,,i] <- get(paste("v",i,sep=""))
intens <- sgmix(mean=mn,vcv=vr,window=toywin,p0=0.1,int=500)

aa <- rpoispp(intens) # Default spatstat function
bb <- rpoispoly(intens) # No polygon supplied; just uses pixel union
cc <- rpoispoly(intens,w=toywin) # Original irregular polygon

par(mfrow=c(2,2))
plot(intens,log=TRUE)
plot(aa,main=paste("aa\nn =",npoints(aa)))
plot(bb,main=paste("bb\nn =",npoints(bb)))
plot(cc,main=paste("cc\nn =",npoints(cc)))



