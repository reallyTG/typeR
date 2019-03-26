library(BEST)


### Name: BEST-package
### Title: Bayesian Estimation Supersedes the t Test
### Aliases: BEST-package BEST
### Keywords: package htest

### ** Examples


## No test: 
## Comparison of two groups:
## =========================
y1 <- c(5.77, 5.33, 4.59, 4.33, 3.66, 4.48)
y2 <- c(3.88, 3.55, 3.29, 2.59, 2.33, 3.59)

# Run an analysis, takes up to 1 min.
BESTout <- BESTmcmc(y1, y2)

# Look at the result:
BESTout
summary(BESTout)
plot(BESTout)
plot(BESTout, "sd")
plotPostPred(BESTout)
plotAll(BESTout, credMass=0.8, ROPEm=c(-0.1,0.1), 
          ROPEeff=c(-0.2,0.2), compValm=0.5) 
plotAll(BESTout, credMass=0.8, ROPEm=c(-0.1,0.1), 
          ROPEeff=c(-0.2,0.2), compValm=0.5, showCurve=TRUE) 
summary(BESTout, credMass=0.8, ROPEm=c(-0.1,0.1), ROPEsd=c(-0.15,0.15),
          ROPEeff=c(-0.2,0.2)) 
pairs(BESTout)

head(BESTout$mu1)
muDiff <- BESTout$mu1 - BESTout$mu2
mean(muDiff > 1.5)
mean(BESTout$sigma1 - BESTout$sigma2)
hist(BESTout$nu)

# Retrospective power analysis
# ----------------------------
# This takes time, so we do 2 simulations here; a real analysis needs several hundred

powerRet <- BESTpower(BESTout, N1=length(y1), N2=length(y2), 
            ROPEm=c(-0.1,0.1), maxHDIWm=2.0, nRep=2) 
powerRet
# We only set criteria for the mean, so results for sd and effect size are all NA.

## Analysis with a single group:
## =============================
y0 <- c(1.89, 1.78, 1.30, 1.74, 1.33, 0.89)

# Run an analysis, takes up to 40 secs.
BESTout1 <- BESTmcmc(y0)
BESTout1
summary(BESTout1)
plot(BESTout1)

head(BESTout1$mu)
mean(BESTout1$sigma)
## End(No test) 



