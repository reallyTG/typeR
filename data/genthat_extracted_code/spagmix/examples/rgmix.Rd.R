library(spagmix)


### Name: rgmix
### Title: Random bivariate Gaussian mixture density generation
### Aliases: rgmix

### ** Examples

set.seed(321)
dens1 <- rgmix(7,window=toywin)
plot(dens1)

set.seed(456)
dens2 <- rgmix(7,window=toywin)
plot(dens2)

# Explicitly return details of generated means and covariances
set.seed(321)
dens1.detailed <- rgmix(7,window=toywin,extras=TRUE)
dens1.detailed$f
dens1.detailed$mn
dens1.detailed$vcv

# Set underlying uniform proportion and compare with dens2 from above
set.seed(456)
dens2.wunif <- rgmix(7,window=toywin,p0=0.3)
par(mfrow=c(1,2))
plot(rpoint(500,dens2))
plot(rpoint(500,dens2.wunif))

# Explicitly setting scale matrix for inverse-wishart generation of covariances
dens3 <- rgmix(3,window=toywin,S=matrix(c(0.025,-0.004,-0.004,0.02),2))
plot(dens3)



