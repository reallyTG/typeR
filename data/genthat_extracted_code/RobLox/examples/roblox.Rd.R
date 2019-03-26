library(RobLox)


### Name: roblox
### Title: Optimally robust estimator for location and/or scale
### Aliases: roblox
### Keywords: robust

### ** Examples

ind <- rbinom(100, size=1, prob=0.05) 
x <- rnorm(100, mean=ind*3, sd=(1-ind) + ind*9)

## amount of gross errors known
res1 <- roblox(x, eps = 0.05, returnIC = TRUE)
estimate(res1)
## don't run to reduce check time on CRAN
## Not run: 
##D confint(res1)
##D confint(res1, method = symmetricBias())
##D pIC(res1)
##D checkIC(pIC(res1))
##D Risks(pIC(res1))
##D Infos(pIC(res1))
##D plot(pIC(res1))
##D infoPlot(pIC(res1))
## End(Not run)

## amount of gross errors unknown
res2 <- roblox(x, eps.lower = 0.01, eps.upper = 0.1, returnIC = TRUE)
estimate(res2)
## don't run to reduce check time on CRAN
## Not run: 
##D confint(res2)
##D confint(res2, method = symmetricBias())
##D pIC(res2)
##D checkIC(pIC(res2))
##D Risks(pIC(res2))
##D Infos(pIC(res2))
##D plot(pIC(res2))
##D infoPlot(pIC(res2))
## End(Not run)

## estimator comparison
# classical optimal (non-robust)
c(mean(x), sd(x))

# most robust
c(median(x), mad(x))

# optimally robust (amount of gross errors known)
estimate(res1)

# optimally robust (amount of gross errors unknown)
estimate(res2)

# Kolmogorov(-Smirnov) minimum distance estimator (robust)
(ks.est <- MDEstimator(x, ParamFamily = NormLocationScaleFamily()))

# optimally robust (amount of gross errors known)
roblox(x, eps = 0.05, initial.est = estimate(ks.est))

# Cramer von Mises minimum distance estimator (robust)
(CvM.est <- MDEstimator(x, ParamFamily = NormLocationScaleFamily(), distance = CvMDist))

# optimally robust (amount of gross errors known)
roblox(x, eps = 0.05, initial.est = estimate(CvM.est))



