library(marmap)


### Name: plotProfile
### Title: Ploting bathymetric data along a transect or path
### Aliases: plotProfile

### ** Examples


# Example 1:
	data(celt)
	layout(matrix(1:2,nc=1),height=c(2,1))
	par(mar=c(4,4,1,1))
	plot(celt,n=40,draw=TRUE)
	points(c(-6.34,-5.52),c(52.14,50.29),type="o",col=2)
	
	tr <- get.transect(celt, x1 = -6.34, y1 = 52.14, x2 = -5.52, y2 = 50.29, distance = TRUE)
	plotProfile(tr)

# Example 2: 
	layout(matrix(1:2,nc=1),height=c(2,1))
	par(mar=c(4,4,1,1))
	plot(celt,n=40,draw=TRUE)
	points(c(-5,-6.34),c(49.8,52.14),type="o",col=2)
	
	tr2 <- get.transect(celt, x1 = -5, y1 = 49.8, x2 = -6.34, y2 = 52.14, distance = TRUE)
	plotProfile(tr2)

# Example 3: click several times on the map and press ESC
## Not run: 
##D 	layout(matrix(1:2,nc=1),height=c(2,1))
##D 	par(mar=c(4,4,1,1))
##D 	data(florida)
##D 	plot(florida,image=TRUE,dra=TRUE,land=TRUE,n=40)
##D 	
##D 	out <- path.profile(as.data.frame(locator(type="o",col=2,pch=19,cex=.8)),florida)
##D 	plotProfile(out)
## End(Not run)



