library(spagmix)


### Name: sgmix
### Title: Bivariate Gaussian mixture density generation
### Aliases: sgmix

### ** Examples

# Example using isotropic standard deviations
m1 <- c(0.4,0.5)
m2 <- c(0.2,0.7)
s1 <- 0.1
s2 <- 0.025
dens1 <- sgmix(mean=cbind(m1,m2),vcv=c(s1,s2),window=toywin,p0=0.3,p=c(0.5,0.2))

plot(dens1,log=TRUE)
pts1 <- rpoint(200,dens1) # generate random points via spatstat::rpoint
points(pts1)


# Example using full covariance matrices
mn <- cbind(c(0.25,0.8),c(0.31,0.82),c(0.43,0.64),c(0.63,0.62),c(0.21,0.26))
v1 <- matrix(c(0.0023,-0.0009,-0.0009,0.002),2)
v2 <- matrix(c(0.0016,0.0015,0.0015,0.004),2)
v3 <- matrix(c(0.0007,0.0004,0.0004,0.0011),2)
v4 <- matrix(c(0.0023,-0.0041,-0.0041,0.0099),2)
v5 <- matrix(c(0.0013,0.0011,0.0011,0.0014),2)
vr <- array(NA,dim=c(2,2,5))
for(i in 1:5) vr[,,i] <- get(paste("v",i,sep=""))
dens2 <- sgmix(mean=mn,vcv=vr,window=toywin,p0=0.1)

plot(dens2,log=TRUE)
pts2 <- rpoint(200,dens2)
points(pts2)



