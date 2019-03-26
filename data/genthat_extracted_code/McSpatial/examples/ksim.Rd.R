library(McSpatial)


### Name: ksim 
### Title: Estimates K-density functions with local or global confidence
###   intervals for counter-factual locations
### Aliases: 'ksim '
### Keywords: Density Functions Nonparametric

### ** Examples

data(matchdata)
lmat <- cbind(matchdata$longitude,matchdata$latitude)
lmat1 <- lmat[matchdata$carea=="Rogers Park"|matchdata$carea=="Albany Park",]
lmat2 <- lmat[matchdata$carea!="Rogers Park"&matchdata$carea!="Albany Park",]
# smaller samples to reduce time for examples
set.seed(4941)
obs <- sample(seq(1,nrow(lmat1)),200)
lmat1 <- lmat1[obs,]
obs <- sample(seq(1,nrow(lmat2)),400)
lmat2 <- lmat2[obs,]

fit <- ksim(lmat1[,1],lmat1[,2],lmat2[,1],lmat2[,2],dmax=9,nsim=100,
  nsamp=100,noplot=TRUE,cglobal=FALSE)
ymin = min(fit$dhat,fit$local.lo)
ymax = max(fit$dhat,fit$local.hi)
plot(fit$distance, fit$dhat, xlab="Distance", ylab="Density", ylim = c(ymin,ymax), 
  type="l", main="Albany Park & Rogers Park v. Other Areas")
lines(fit$distance, fit$local.lo, col="red")
lines(fit$distance, fit$local.hi, col="red")



