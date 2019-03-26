library(ads)


### Name: spp
### Title: Creating a spatial point pattern
### Aliases: spp print.spp summary.spp print.summary.spp ppp2spp
### Keywords: spatial

### ** Examples

	data(BPoirier)
	BP <- BPoirier
	# univariate pattern in a rectangle of size [0,110] x [0,90]
	swr <- spp(BP$trees, win=BP$rect)
	# an alternative using atomic vectors of point coordinates
	#swr <- spp(BP$trees, win=BP$rect) 
	summary(swr)
	plot(swr)
	
	# univariate pattern in a circle with radius 50 centred on (55,45)
	swc <- spp(BP$trees, win=c(55,45,50))
	summary(swc)
	plot(swc)
	plot(swc, out=TRUE) # plot points outside the circle

	# multivariate pattern in a rectangle of size [0,110] x [0,90]
	swrm <- spp(BP$trees, win=BP$rect, marks=BP$species)
	summary(swrm)
	plot(swrm)
	plot(swrm, chars=c("b","h","o")) # replace symbols by letters
	
	# marked pattern in a rectangle of size [0,110] x [0,90]
	swrn <- spp(BP$trees, win=BP$rect, marks=BP$dbh)
	summary(swrn)
	plot(swrn)
	
	# multivariate pattern in a complex sampling window
	swrt <- spp(BP$trees, win=BP$rect, tri=BP$tri1, marks=BP$species)
	summary(swrt)
	plot(swrt)
	plot(swrt, out=TRUE) # plot points outside the sampling window
	
	
	#converting a ppp object from spatstat
	data(demopat)
	demo.spp<-ppp2spp(demopat)
	plot(demo.spp)



