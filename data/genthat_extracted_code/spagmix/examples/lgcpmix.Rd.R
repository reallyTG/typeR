library(spagmix)


### Name: lgcpmix
### Title: Generate a spatial log-Gaussian Cox process intensity
### Aliases: lgcpmix

### ** Examples

## Homogeneous example ##

# Create constant intensity image integrating to 500

homog <- as.im(as.mask(toywin))
homog <- homog/integral(homog)*500


# Corresponding LGCP realisations using exponential covariance structure
par(mfrow=c(2,2),mar=rep(1.5,4))
for(i in 1:4){
  temp <- lgcpmix(homog,covmod="exp",covpars=list(var=1,scale=0.2))
  plot(temp,main=paste("Realisation",i),log=TRUE)
}



## Inhomogeneous examples ##

# Create deterministic trend

mn <- cbind(c(0.25,0.8),c(0.31,0.82),c(0.43,0.64),c(0.63,0.62),c(0.21,0.26))
v1 <- matrix(c(0.0023,-0.0009,-0.0009,0.002),2)
v2 <- matrix(c(0.0016,0.0015,0.0015,0.004),2)
v3 <- matrix(c(0.0007,0.0004,0.0004,0.0011),2)
v4 <- matrix(c(0.0023,-0.0041,-0.0041,0.0099),2)
v5 <- matrix(c(0.0013,0.0011,0.0011,0.0014),2)
vr <- array(NA,dim=c(2,2,5))
for(i in 1:5) vr[,,i] <- get(paste("v",i,sep=""))
intens <- sgmix(mean=mn,vcv=vr,window=toywin,p0=0.1,int=500)


# Two realisations (identical calls to function), exponential covariance structure

r1exp <- lgcpmix(lambda=intens,covmodel="exp",covpars=list(var=2,scale=0.05))
r2exp <- lgcpmix(lambda=intens,covmodel="exp",covpars=list(var=2,scale=0.05))


# Two more realisations, Matern covariance with smoothness 1

r1mat <- lgcpmix(lambda=intens,covmodel="matern",covpars=list(var=2,scale=0.05,nu=1))
r2mat <- lgcpmix(lambda=intens,covmodel="matern",covpars=list(var=2,scale=0.05,nu=1))


# Plot everything, including 'intens' alone (no correlation)

par(mar=rep(2,4))
layout(matrix(c(1,2,4,1,3,5),3))
plot(intens,main="intens alone",log=TRUE)
plot(r1exp,main="realisation 1\nexponential covar",log=TRUE)
plot(r2exp,main="realisation 2\nexponential covar",log=TRUE)
plot(r1mat,main="realisation 1\nMatern covar",log=TRUE)
plot(r2mat,main="realisation 2\nMatern covar",log=TRUE)


# Plot example datasets
dint <- rpoispoly(intens,w=toywin)
d1exp <- rpoispoly(r1exp,w=toywin)
d2exp <- rpoispoly(r2exp,w=toywin)
d1mat <- rpoispoly(r1mat,w=toywin)
d2mat <- rpoispoly(r2mat,w=toywin)

par(mar=rep(2,4))
layout(matrix(c(1,2,4,1,3,5),3))
plot(dint,main="intens alone",log=TRUE)
plot(d1exp,main="realisation 1\nexponential covar",log=TRUE)
plot(d2exp,main="realisation 2\nexponential covar",log=TRUE)
plot(d1mat,main="realisation 1\nMatern covar",log=TRUE)
plot(d2mat,main="realisation 2\nMatern covar",log=TRUE)



