library(unmarked)


### Name: distsamp
### Title: Fit the hierarchical distance sampling model of Royle et al.
###   (2004)
### Aliases: distsamp
### Keywords: models

### ** Examples

## Line transect examples

data(linetran)

ltUMF <- with(linetran, {
   unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4),
   siteCovs = data.frame(Length, area, habitat),
   dist.breaks = c(0, 5, 10, 15, 20),
   tlength = linetran$Length * 1000, survey = "line", unitsIn = "m")
   })

ltUMF
summary(ltUMF)
hist(ltUMF)

# Half-normal detection function. Density output (log scale). No covariates.
(fm1 <- distsamp(~ 1 ~ 1, ltUMF))

# Some methods to use on fitted model
summary(fm1)
backTransform(fm1, type="state")                # animals / ha
exp(coef(fm1, type="state", altNames=TRUE))     # same
backTransform(fm1, type="det")                  # half-normal SD
hist(fm1, xlab="Distance (m)")	# Only works when there are no det covars
# Empirical Bayes estimates of posterior distribution for N_i
plot(ranef(fm1, K=50))

# Effective strip half-width
(eshw <- integrate(gxhn, 0, 20, sigma=10.9)$value)

# Detection probability
eshw / 20 # 20 is strip-width


# Halfnormal. Covariates affecting both density and and detection.
(fm2 <- distsamp(~area + habitat ~ habitat, ltUMF))

# Hazard-rate detection function.
(fm3 <- distsamp(~ 1 ~ 1, ltUMF, keyfun="hazard"))

# Plot detection function.
fmhz.shape <- exp(coef(fm3, type="det"))
fmhz.scale <- exp(coef(fm3, type="scale"))
plot(function(x) gxhaz(x, shape=fmhz.shape, scale=fmhz.scale), 0, 25,
	xlab="Distance (m)", ylab="Detection probability")



## Point transect examples

# Analysis of the Island Scrub-jay data.
# See Sillett et al. (In press)

data(issj)
str(issj)

jayumf <- unmarkedFrameDS(y=as.matrix(issj[,1:3]),
 siteCovs=data.frame(scale(issj[,c("elevation","forest","chaparral")])),
 dist.breaks=c(0,100,200,300), unitsIn="m", survey="point")

(fm1jay <- distsamp(~chaparral ~chaparral, jayumf))




## Not run: 
##D 
##D data(pointtran)
##D 
##D ptUMF <- with(pointtran, {
##D 	unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4, dc5),
##D 	siteCovs = data.frame(area, habitat),
##D 	dist.breaks = seq(0, 25, by=5), survey = "point", unitsIn = "m")
##D 	})
##D 
##D # Half-normal.
##D (fmp1 <- distsamp(~ 1 ~ 1, ptUMF))
##D hist(fmp1, ylim=c(0, 0.07), xlab="Distance (m)")
##D 
##D # effective radius
##D sig <- exp(coef(fmp1, type="det"))
##D ea <- 2*pi * integrate(grhn, 0, 25, sigma=sig)$value # effective area
##D sqrt(ea / pi) # effective radius
##D 
##D # detection probability
##D ea / (pi*25^2)
##D 
## End(Not run)



