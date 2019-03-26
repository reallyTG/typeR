library(unmarked)


### Name: unmarkedFrame
### Title: Create an unmarkedFrame, or one of its child classes.
### Aliases: unmarkedFrame

### ** Examples


# Set up data for pcount()
data(mallard)
mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site,
	obsCovs = mallard.obs)
summary(mallardUMF)


# Set up data for occu()
data(frogs)
pferUMF <- unmarkedFrameOccu(pfer.bin)


# Set up data for distsamp()
data(linetran)
ltUMF <- with(linetran, {
	unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4),
	siteCovs = data.frame(Length, area, habitat),
	dist.breaks = c(0, 5, 10, 15, 20),
	tlength = linetran$Length * 1000, survey = "line", unitsIn = "m")
	})
summary(ltUMF)


# Set up data for multinomPois()
data(ovendata)
ovenFrame <- unmarkedFrameMPois(ovendata.list$data,
	siteCovs=as.data.frame(scale(ovendata.list$covariates[,-1])),
	type = "removal")
summary(ovenFrame)


## Not run: 
##D # Set up data for colext()
##D frogUMF <- formatMult(masspcru)
##D summary(frogUMF)
## End(Not run)




