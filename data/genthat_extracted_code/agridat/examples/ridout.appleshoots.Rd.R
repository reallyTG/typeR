library(agridat)


### Name: ridout.appleshoots
### Title: Root counts for propagated columnar apple shoots.
### Aliases: ridout.appleshoots
### Keywords: datasets

### ** Examples


data(ridout.appleshoots)
dat <- ridout.appleshoots

# Change photo and bap to factors
dat <- transform(dat, photo=factor(photo), bap=factor(bap))

library(lattice)
# histogram(~roots, dat, breaks=0:18-0.5)

# For photo=8, Poisson distribution looks reasonable.
# For photo=16, half of the shoots had no roots
# Also, photo=8 has very roughly 1/45 as many zeros as photo=8,
# so we anticipate prob(zero) is about 1/45=0.22 for photo=8.
histogram(~roots|photo, dat, breaks=0:18-0.5, main="ridout.appleshoots")

foo.obs <- histogram(~roots|photo*bap, dat, breaks=0:18-0.5, type="density",
                     xlab="Number of roots for photoperiod 8, 16",
                     ylab="Density for BAP levels",
                     main="ridout.appleshoots")
if(require(latticeExtra)) useOuterStrips(foo.obs) else print(foo.obs)

# Ordinary (non-ZIP) Poisson GLM
m1 <- glm(roots ~ bap + photo + bap:photo, data=dat,
          family="poisson")
summary(m1) # Appears to have overdispersion


# ----- Fit a Zero-Inflated Poisson model -----

if(require(pscl)){

# Use SAS contrasts to match SAS output
oo <- options(contrasts=c('contr.SAS','contr.poly'))

# There are unequal counts for each trt combination, which obviously affects
# the distribution of counts, so use log(trtn) as an offset.
dat$ltrtn <- log(dat$trtn)

# Ordinary Poisson GLM: 1 + bap*photo.
# Zero inflated probability depends only on photoperiod: 1 + photo

m2 <- zeroinfl(roots ~ 1 + bap*photo | 1 + photo, data=dat,
          dist="poisson", offset=ltrtn)
logLik(m2)      # -622.2283 matches SAS Output 1
-2 * logLik(m2) # 1244.457 Matches Ridout Table 2, ZIP, H*P, P
summary(m2)     # Coefficients match SAS Output 3.

exp(coef(m2, "zero")) # Photo=8 has .015 times as many zeros as photo=16

# Get predicted _probabilities_

# Prediction data
newdat <- expand.grid(photo=c(8,16), bap=c(2.2, 4.4, 8.8, 17.6))
newdat <- aggregate(trtn~bap+photo, dat, FUN=mean)
newdat$ltrtn <- log(newdat$trtn)

# The predicted (Poisson + Zero) probabilities
d2 <- cbind(newdat[,c('bap','photo')], predict(m2, newdata=newdat, type="prob"))
if(require(reshape2)){
d2 <- melt(d2, id.var = c('bap','photo')) # wide to tall
d2$xpos <- as.numeric(as.character(d2$variable))
foo.poi <- xyplot(value~xpos|photo*bap, d2, col="black", pch=20, cex=1.5)

# Plot data and model
foo.obs <- update(foo.obs, main="ridout.appleshoots: observed (bars) & predicted (dots)")
useOuterStrips(foo.obs + foo.poi)
}
  
# Restore contrasts
options(oo)

}




