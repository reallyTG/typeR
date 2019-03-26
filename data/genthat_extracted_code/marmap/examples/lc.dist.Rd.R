library(marmap)


### Name: lc.dist
### Title: Computes least cost distances between two or more locations
### Aliases: lc.dist

### ** Examples

# Load and plot bathymetry
	data(hawaii)
	pal <- colorRampPalette(c("black","darkblue","blue","lightblue"))
	plot(hawaii,image=TRUE,bpal=pal(100),asp=1,col="grey40",lwd=.7,
	     main="Bathymetric map of Hawaii")

# Load and plot several locations
	data(hawaii.sites)
	sites <- hawaii.sites[-c(1,4),]
	rownames(sites) <- 1:4
	points(sites,pch=21,col="yellow",bg=col2alpha("yellow",.9),cex=1.2)
	text(sites[,1],sites[,2],lab=rownames(sites),pos=c(3,4,1,2),col="yellow")

## Not run: 
##D # Compute transition object with no depth constraint
##D 	trans1 <- trans.mat(hawaii)
##D 
##D # Compute transition object with minimum depth constraint: 
##D # path impossible in waters shallower than -200 meters depth
##D 	trans2 <- trans.mat(hawaii,min.depth=-200)
##D 
##D # Computes least cost distances for both transition matrix and plots the results on the map
##D 	out1 <- lc.dist(trans1,sites,res="path")
##D 	out2 <- lc.dist(trans2,sites,res="path")
##D 	lapply(out1,lines,col="yellow",lwd=4,lty=1) # No depth constraint (yellow paths)
##D 	lapply(out2,lines,col="red",lwd=1,lty=1) # Min depth set to -200 meters (red paths)
##D 
##D # Computes and display distance matrices for both situations
##D 	dist1 <- lc.dist(trans1,sites,res="dist")
##D 	dist2 <- lc.dist(trans2,sites,res="dist")
##D 	dist1
##D 	dist2
##D 
##D # plots the depth profile between location 1 and 3 in the two situations
##D 	dev.new()
##D 	par(mfrow=c(2,1))
##D 	path.profile(out1[[2]],hawaii,pl=TRUE,
##D                  main="Path between locations 1 & 3\nProfile with no depth constraint")
##D 	path.profile(out2[[2]],hawaii,pl=TRUE,
##D                  main="Path between locations 1 & 3\nProfile with min depth set to -200m")
## End(Not run)



