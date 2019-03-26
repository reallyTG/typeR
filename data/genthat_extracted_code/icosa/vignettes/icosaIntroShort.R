## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
library(icosa)
library(rgl)
knit_hooks$set(rgl = hook_rgl)

## ----first, rgl=TRUE,dev='png',dpi=300, fig.width=6, fig.height=4--------
library(icosa)
# create a trigrid class object
tri <- trigrid()

# the show() method displays basic information
tri

# plot the object in 3d
plot3d(tri, guides=F)

## ----crs, rgl=TRUE,dev='png',dpi=300-------------------------------------
tri@proj4string

## ----trigrid, rgl=TRUE,dev='png',dpi=300---------------------------------
# create a trigrid class object
gLow <- trigrid(tessellation=c(4,4))

# plot the object in 3d
plot3d(gLow, guides=F)

## ----hexagrid1, rgl=TRUE,dev='png',dpi=300-------------------------------
# create a hexagrid object
hLow <- hexagrid()

# plot it in 3d
plot3d(hLow, guides=F)

## ----hexagrid, rgl=TRUE,dev='png',dpi=300--------------------------------
# create a hexagrid object
hLow <- hexagrid(c(4,4))

# plot it in 3d
plot3d(hLow)

## ----tri2, rgl=TRUE,dev='png',dpi=300------------------------------------
# the beginning of the vertices matrix
head(gLow@vertices)

# the beginning of the faces matrix
head(gLow@faces)

## ----tri3, rgl=TRUE,dev='png',dpi=300------------------------------------
# grid radius
gLow@r

# grid center
gLow@center

## ----tri5, rgl=TRUE,dev='png',dpi=300------------------------------------
head(gLow@faceCenters)

## ----tri7, rgl=TRUE,dev='png',dpi=300------------------------------------
head(gLow@edges)

## ----tri6, rgl=TRUE,dev='png',dpi=300------------------------------------
plot3d(gLow)
gridlabs3d(gLow, type="v", col="blue", cex=0.6)

## ----tri8, rgl=TRUE,dev='png',dpi=300------------------------------------
gLow2 <- rotate(gLow) # random rotation
plot3d(gLow2)
guides3d(col="green")

## ----tri9, rgl=TRUE,dev='png',dpi=300------------------------------------
# select faces F1000 through F1800
gLowSub <- subset(gLow, paste("F",1000:1800, sep=""))
plot3d(gLowSub)

## ----tri9e, rgl=TRUE,dev='png',dpi=300-----------------------------------
# numeric subscript: polar coordinates
gLowSub3<-gLow[c(lamax=30)]
plot3d(gLowSub3)

## ----tri9d, rgl=TRUE,dev='png',dpi=300-----------------------------------
# numeric subscript: polar coordinates
gLowSub4<-gLow[c(lamax=30, lamin=-30, lomin=-120,lomax=-60)]
plot3d(gLowSub4)

## ----belts, rgl=TRUE,dev='png',dpi=300-----------------------------------
# logical subscript
gLowSub5<-gLow[gLow@belts==17]

# the 17th belt
plot3d(gLow)
faces3d(gLowSub5, col="blue")

## ----belts2, rgl=TRUE,dev='png',dpi=300----------------------------------
# transform the faceCenter coordinates
longLat <- CarToPol(gLowSub5@faceCenters, norad=T)
mean(longLat[,2])

## ----tri9c, rgl=TRUE,dev='png',dpi=300-----------------------------------
str(gLow@skeleton)

## ----first2, rgl=TRUE,dev='png',dpi=300, fig.width=6, fig.height=4-------
plot3d(tri, guides=F, arcs=T, sphere=6300)

## ----tri10, plot=TRUE, ,dev='png',dpi=300--------------------------------
hLow <- newsp(hLow)
# After this procedure finishes, a regular 2d plotting function can be invoked:
plot(hLow)

## ----tri11, plot=TRUE, ,dev='png',dpi=300--------------------------------
# Lambert cylcindrical equal area projection
cea <- "+proj=cea"
plot(hLow, projargs=cea)

## ----tri11AA,results='hide'----------------------------------------------
# load rgdal package for the CRS function
library(rgdal)

## ----tri11B, plot=TRUE, ,dev='png',dpi=300-------------------------------
# The Mollweide projection
moll <- CRS("+proj=moll")
plot(hLow, projargs=moll)

## ----tri23, plot=TRUE,dev='png',dpi=300,echo=TRUE, results='hide'--------
# file path
file <- system.file("extdata", "land_polygons_z3.shx", package = "icosa")

# read in the shape file
wo <- readOGR(file, "land_polygons_z3")

## ----examplePaleo, plot=TRUE, ,dev='png',dpi=300-------------------------
# transform the land data to long-lat coordinates
wo <- spTransform(wo, gLow@proj4string)

#triangular grid
gLow<-newsp(gLow)

# load in a map
# plot the grid (default longitude/latitude)
plot(gLow, border="gray", lty=1)

# the reconstruction
lines(wo, lwd=2, col="blue")

## ----examplePaleo2, plot=TRUE, ,dev='png',dpi=300------------------------
# the Winkel tripel projection
wintri<-CRS("+proj=wintri")

# plot the grid (default longitude/latitude)
gLow2d<-SpPolygons(gLow, res=50) 			# create SpatialPolygons
gLow2dTrans<-spTransform(gLow2d, wintri) 	# transform projection
plot(gLow2dTrans, border="gray",lty=1) 		# plot

#transform the reconstruction
woTrans<-spTransform(wo, CRS("+proj=wintri"))

# the reconstruction
lines(woTrans, lwd=2, col="blue")

## ----tri12, plot=TRUE, ,dev='png',dpi=300--------------------------------
# a very low resolution hexagrid
hVeryLow<-hexagrid(c(4))
# add 2d component
hVeryLow<-newsp(hVeryLow)
# the Robinson projection
robin <- CRS("+proj=robin")
# plot with labels
plot(hVeryLow, projargs=robin)
gridlabs(hVeryLow, type="f", cex=0.6,projargs=robin)

## ----tri13, echo=TRUE----------------------------------------------------
pos(hLow, c("P2", "F12", NA))

## ----tri14, echo=TRUE----------------------------------------------------
fl1<-facelayer(gLow) # the argument is the grid object to which the layer is linked
fl1
str(fl1)

## ----tri15, echo=TRUE----------------------------------------------------
length(fl1)

## ----tri16, echo=TRUE----------------------------------------------------
values(fl1) <-1:length(fl1)
values(fl1)[1:10]

## ----tri17, echo=TRUE, results='hide'------------------------------------
# layer definition
fl2<-facelayer(gLow)
# all values should be one
values(fl2)[] <- 1

# layer arithmetics
fl1+fl2
fl1*4

## ----tri18, rgl=TRUE,dev='png',dpi=300-----------------------------------
a <-facelayer(gLow)
values(a) <- sample(c(T,F), length(a), replace=T)
# plot the grid first
plot3d(gLow, guides=F)

# invoke lower level plotting for the facelayer 
# (draws on previously plotted rgl environemnts)
faces3d(a, col="green")

## ----tri19, rgl=TRUE,dev='png',dpi=300-----------------------------------
# new layer
b<-facelayer(gLow)
# sequenced values 
values(b)<-1:length(b)
# plot3d method of the facelayer (implements faces3d too)
plot3d(b, guides=F, frame=F)

## ----tri19b, rgl=TRUE,dev='png',dpi=300----------------------------------
# new layer
# grid frame
plot3d(gLow)
# the heatmap
faces3d(b, col=c("green", "brown")) 

## ----tri19c, rgl=TRUE,dev='png',dpi=300----------------------------------
# plot3d method of the facelayer (implements faces3d too)
par3d(windowRect=c(20,30,1000,400))
plot3d(b, guides=F, frame=F, defaultPar3d=F)

## ----categ1, rgl=TRUE,dev='png',dpi=300----------------------------------
# new layer
catLayer<-facelayer(hLow)

# assign random information
catLayer@values<-sample(c("one","two","three"),length(catLayer), replace=T)

plot(catLayer)

## ----categ2, rgl=TRUE,dev='png',dpi=300----------------------------------
# the colours of the variables
allColours<-c("red", "blue", "orange")
par(mar=c(4,2,4,6), xpd=TRUE)
plot(hLow, col=allColours[as.numeric(factor(catLayer@values))])

# draw a rudimentary legend
legend("right",fill=allColours, legend=levels(factor(catLayer@values)), inset=c(-0.15,0))


## ----tri20, rgl=TRUE,dev='png',dpi=300-----------------------------------
# generate 50000 random coordinates on a sphere of default radius
pointdat <- rpsphere(5000)

# and locate them on the grid 'gLow'
cells<-locate(gLow, pointdat)

# the return of this function is vector of cell names
head(cells)

## ----tri20b, rgl=TRUE,dev='png',dpi=300----------------------------------
tCell <- table(cells)
fl <- facelayer(gLow,0)
# [] invokes a method that save the values to places that 
# correspond to the names attribute of tCell
fl[] <-tCell #
# heat map of the point densities
plot3d(fl)
 

## ----tri21, rgl=TRUE,dev='png',dpi=300-----------------------------------
# do the same for the hexagrid
cells2<- locate(hLow, pointdat)
b<-facelayer(hLow,0) # initialize to 0
b[]<-table(cells2)
# hLow<-newsp(hLow) # was run before

# plot the faces
plot(b, axes=T) 

## ----tri22, rgl=TRUE,dev='png',dpi=300-----------------------------------
# run function only on the first 300
fl<-occupied(hLow, pointdat[1:300,])

# after the SpatialPolygons object is calculated
# hLow<-newsp(hLow) # was run before

# the plot function can also be applied to the facelayer object
plot(fl, col="blue")

# show the points as well
points(CarToPol(pointdat[1:300,]), col="red", pch=3, cex=0.7)

## ----tri22b, rgl=TRUE,dev='png',dpi=300----------------------------------
# the plot function can also be applied to the facelayer object
plot(fl, col="blue")

points(CarToPol(pointdat[1:300,]), col="red", pch=3, cex=0.7)
lines(hLow, col="gray")

## ----tri24, rgl=TRUE,dev='png',dpi=300-----------------------------------
# transform it to SpatialLines
woL <- as(wo, "SpatialLines")
woP <- as(woL, "SpatialPoints")

# the facelayer of the occupied cells
fL<-occupied(hLow, woP)

plot3d(fL, col="red")

## ----tri26, rgl=TRUE,dev='png',dpi=300-----------------------------------
# look up the polygons
landFaces<-occupied(hLow, wo)
# the empty grid
plot3d(hLow, guides=F)

# the landmass of the world
faces3d(landFaces, col="blue")

## ----tri26b, plot=TRUE,dev='png',dpi=300---------------------------------
library(raster)

# read in the file
file<-system.file("extdata", "prec1_1degree.grd", package = "icosa")
r<-raster(file)

# plot the raster
plot(r)

## ----tri27, rgl=TRUE,dev='png',dpi=300-----------------------------------

# resample the original data
resDat<-resample(r, hLow, "ngb")

## ----tri28, rgl=TRUE,dev='png',dpi=300-----------------------------------
# new facelayer
precLayer<- facelayer(hLow)
# fill in the new facelayer
precLayer[]<-resDat

## ----tri29, rgl=TRUE,dev='png',dpi=300-----------------------------------
# the grid 
plot3d(precLayer, col=c("red","orange", "yellow", "cyan", "blue"))

## ----tri30, plot=TRUE,dev='png',dpi=300----------------------------------
# the 
plot(precLayer, col=c("red","orange", "yellow", "cyan", "blue"), tick.cex=0.7, axes=T)

## ----vic1, rgl=TRUE,dev='png',dpi=300------------------------------------
# calculate a very coarse resolution grid
gVeryLow<-trigrid(8, sp=T)
# names of faces that are neighbours to face F125
facenames<-vicinity(gVeryLow, "F125")
# plot a portion of the grid
plot(gVeryLow, xlim=c(0,180), ylim=c(0,90))
# plot the original and the neighbouring faces
plot(gVeryLow@sp[facenames], col="red", add=T)
# the names of all the cells
gridlabs(gVeryLow, type="f", cex=0.5)

## ----vic2, rgl=TRUE,dev='png',dpi=300------------------------------------
# the neighbours of cells F125 and F126
facenames2<-vicinity(gVeryLow, c("F125", "F126"))
# plot the empty grid 
plot(gVeryLow, xlim=c(0,180), ylim=c(0,90))
# plot these faces with red
plot(gVeryLow@sp[facenames2], col="red", add=T)
# the names of the cells
gridlabs(gVeryLow, type="f", cex=0.5)

## ----vic3, rgl=TRUE,dev='png',dpi=300------------------------------------
# the 2nd order neighbourhood of cell F125
facenames3 <- vicinity(gVeryLow, c("F125"), order=2)
# empty grid
plot(gVeryLow, xlim=c(0,180), ylim=c(0,90))
# the neighbourhood
plot(gVeryLow@sp[facenames3], col="red", add=T)
# the names of the cells
gridlabs(gVeryLow, type="f", cex=0.5)

## ----vic4, rgl=TRUE,dev='png',dpi=300------------------------------------
# the neighbours a cell 
facenames4 <- vicinity(gLow, c("F125", "F126"), output="list", order=2)

## ----vic54, rgl=TRUE,dev='png',dpi=300-----------------------------------
# the names of the neighbouring cells of F125, without itself
facenames5<-vicinity(gVeryLow, "F125", self=F)
# plot the empty grid
plot(gVeryLow, xlim=c(0,180), ylim=c(0,90))
# plot the neighbours
plot(gVeryLow@sp[facenames5], col="red", add=T)
# the names of the cells
gridlabs(gVeryLow, type="f", cex=0.5)

## ----ggraph, dev='png',dpi=300-------------------------------------------
# new graph from the faces of the icosahedron
graphTri <- gridgraph(tri)
plot(graphTri)

## ----ggraph2, rgl=TRUE,dev='png',dpi=300---------------------------------
# new graph
graphTriDir <- gridgraph(tri, directed=T)
plot(graphTriDir)

## ----ggraphAttach, results='hide'----------------------------------------
# attach igraph
library(igraph)

## ----ggraph4,dev='png',dpi=300, echo=TRUE, results='hide'----------------
faces<-paste("F", 1:10, sep="")
subGraph <- induced_subgraph(graphTri,faces) 
plot(subGraph)

## ----ggraph5,dev='png',dpi=300-------------------------------------------
lowGraph<-gLow[1:12]@graph

## ----ggraph4b, dev='png',dpi=300-----------------------------------------
landGraph<-gridgraph(landFaces)
plot(landFaces, col="brown")

## ----ggraph6, dev='png',dpi=300------------------------------------------
# shortest path in igraph
path <- shortest_paths(landGraph, from="F432", to="F1073", output="vpath")
# the names of the cells in order
cells<-path$vpath[[1]]$name
# plot the map
plot(landFaces, col="brown", xlim=c(0,90), ylim=c(0,90))
# make a subset of the grid - which corresponds to the path
routeGrid<-hLow[cells]
# plot the path
plot(routeGrid, col="red", add=T)

## ----ggraph6b, dev='png',dpi=300-----------------------------------------
# plot the map
plot(landFaces, col="brown", xlim=c(0,90), ylim=c(0,90))
# create a random walk from source cell with a given no. of steps
randomWalk <- random_walk(landGraph, steps=100, start="F432")
# the names of the cells visited by the random walker
cells<-randomWalk$name
# the source cell
plot(hLow["F432"], col="green",add=T)
# the centers of these faces
centers<-CarToPol(hLow@faceCenters[cells,], norad=T)
# draw the lines of the random walk
for(i in 2:nrow(centers)){
	segments(x0=centers[i-1,1], y0=centers[i-1,2], x1=centers[i,1], y1=centers[i,2], lwd=2)
}

## ----tri31, rgl=TRUE,dev='png',dpi=300-----------------------------------
# sphere 1
aSphere<-rpsphere(n=250, origin=c(0,0,0), radius=1)
# sphere 2
bSphere<-rpsphere(n=250, origin=c(1,1,1), radius=3)
points3d(aSphere, col="blue")
points3d(bSphere, col="red")

## ----tri4, plot=TRUE,dev='png',dpi=300-----------------------------------
# coordinate transformations from cartesian to polar:
v2d <- CarToPol(gLow@vertices)
plot(v2d, xlim=c(-180,180), ylim=c(-90,90))

# coordinate transformation from polar to cartesian
longLatMat<-rbind(c(35,20), c(45,50))
PolToCar(longLatMat)

## ----triarc, plot=TRUE,dev='png',dpi=300---------------------------------
#great circle distance matrix between the facecenters
amat<-arcdistmat(hLow@faceCenters, radius=hLow@r, origin=hLow@center)

# the relationship of the first 6 points
amat[1:6,1:6]

## ----triarc2, plot=TRUE,dev='png',dpi=300--------------------------------
randPoints<-rpsphere(15)
#great circle distance matrix between the facecenters
amat<-arcdistmat(hLow@faceCenters, randPoints, radius=hLow@r, origin=hLow@center)

# the relationship of the first 6 points
amat[1:6,1:6]

