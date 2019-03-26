library(MapGAM)


### Name: sampcont
### Title: Unmatched Control Sampling
### Aliases: sampcont
### Keywords: misc

### ** Examples

#### load beertweets data, which has 719 cases and 9281 controls
data(beertweets)
# take a simple random sample of 1000 controls
samp1 <- sampcont(beertweets, type="simple", n=1000)

# take a stratified random sample of controls on a 80x50 grid
# requires PBSmapping package
samp2 <- NULL
## No test: 
if(require(PBSmapping)) samp2 <- sampcont(beertweets, nrow=80, ncol=50)

# Compare locations for the two sampling designs (cases in red)
par(mfrow=c(2,1), mar=c(0,3,4,3))
plot(samp1$rdata$longitude, samp1$rdata$latitude, col=3-samp1$rdata$beer,
	cex=0.5, type="p", axes=FALSE, ann=FALSE)
# Show US base map if maps package is available
mapUS <- require(maps)
if (mapUS) map("state", add=TRUE)
title("Simple Random Sample, 1000 Controls")

if (!is.null(samp2)) {
	plot(samp2$rdata$longitude, samp2$rdata$latitude, 
		col=3-samp2$rdata$beer, cex=0.5, type="p", axes=FALSE, 
		ann=FALSE)
	if (mapUS) map("state", add=TRUE)
	title(paste("Spatially Stratified Sample,",samp2$ncont,"Controls"))
	}
## End(No test)
par(mfrow=c(1,1))

## Note that weights are needed in statistical analyses
# Prevalence of cases in sample--not in source data
mean(samp1$rdata$beer)		 
# Estimated prevalence of cases in source data 
weighted.mean(samp1$rdata$beer, w=samp1$w)	
## Do beer tweet odds differ below the 36.5 degree parallel?
# Using full data
glm(beer~I(latitude<36.5), family=binomial, data=beertweets) 
# Stratified sample requires sampling weights 
if (!is.null(samp2)) glm(beer~I(latitude<36.5), family=binomial, 
	data=samp2$rdata, weights=samp2$w)



