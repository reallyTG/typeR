library(rgdal)


### Name: spTransform-methods
### Title: Methods for Function spTransform for map projection and datum
###   transformation in package "rgdal"
### Aliases: spTransform-methods spTransform
###   spTransform,SpatialPoints,CRS-method
###   spTransform,SpatialPointsDataFrame,CRS-method
###   spTransform,SpatialPixelsDataFrame,CRS-method
###   spTransform,SpatialGridDataFrame,CRS-method
###   spTransform,SpatialLines,CRS-method
###   spTransform,SpatialPolygons,CRS-method spTransform.SpatialPoints
###   spTransform.SpatialPointsDataFrame spTransform.SpatialLines
###   spTransform.SpatialLinesDataFrame
###   spTransform,SpatialLinesDataFrame,CRS-method
###   spTransform.SpatialPolygons spTransform.SpatialPolygonsDataFrame
###   spTransform,SpatialPolygonsDataFrame,CRS-method
### Keywords: methods spatial

### ** Examples

data(state)
states <- data.frame(state.x77, state.center)
states <- states[states$x > -121,]
coordinates(states) <- c("x", "y")
proj4string(states) <- CRS("+proj=longlat +ellps=clrk66")
summary(states)
state.ll83 <- spTransform(states, CRS("+proj=longlat +ellps=GRS80"))
summary(state.ll83)
state.merc <- spTransform(states, CRS=CRS("+proj=merc +ellps=GRS80"))
summary(state.merc)
state.merc <- spTransform(states,
 CRS=CRS("+proj=merc +ellps=GRS80 +units=us-mi"))
summary(state.merc)
if (projNAD()) {
states <- data.frame(state.x77, state.center)
states <- states[states$x > -121,]
coordinates(states) <- c("x", "y")
proj4string(states) <- CRS("+init=epsg:4267")
print(summary(states))
state.ll83 <- spTransform(states, CRS("+init=epsg:4269"))
print(summary(state.ll83))
state.kansasSlcc <- spTransform(states, CRS=CRS("+init=epsg:26978"))
print(summary(state.kansasSlcc))
SFpoint_NAD83 <- SpatialPoints(matrix(c(-103.869667, 44.461676), nrow=1),
 proj4string=CRS("+init=epsg:4269"))
SFpoint_NAD27 <- spTransform(SFpoint_NAD83, CRS("+init=epsg:4267"))
print(all.equal(coordinates(SFpoint_NAD83), coordinates(SFpoint_NAD27)))
print(coordinates(SFpoint_NAD27), digits=12)
print(coordinates(SFpoint_NAD83), digits=12)
}
data(meuse)
coordinates(meuse) <- c("x", "y")
proj4string(meuse) <- CRS(paste("+init=epsg:28992",
 "+towgs84=565.237,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812"))
# see http://trac.osgeo.org/gdal/ticket/1987
summary(meuse)
meuse.utm <- spTransform(meuse, CRS("+proj=utm +zone=32 +datum=WGS84"))
summary(meuse.utm)
cbind(coordinates(meuse), coordinates(meuse.utm))
kiritimati_primary_roads <- readOGR(system.file("vectors",
 package = "rgdal")[1], "kiritimati_primary_roads")
kiritimati_primary_roads_ll <- spTransform(kiritimati_primary_roads,
 CRS("+proj=longlat +datum=WGS84"))
opar <- par(mfrow=c(1,2))
plot(kiritimati_primary_roads, axes=TRUE)
plot(kiritimati_primary_roads_ll, axes=TRUE, las=1)
par(opar)
opar <- par(mfrow=c(1,2))
scot_BNG <- readOGR(system.file("vectors", package = "rgdal")[1],
   "scot_BNG")
scot_LL <- spTransform(scot_BNG, CRS("+proj=longlat +datum=WGS84"))
plot(scot_LL, axes=TRUE)
grd_LL <- gridlines(scot_LL, ndiscr=100)
summary(grd_LL)
grd_BNG <- spTransform(grd_LL, CRS(proj4string(scot_BNG)))
grdtxt_LL <- gridat(scot_LL)
grdtxt_BNG <- spTransform(grdtxt_LL, CRS(proj4string(scot_BNG)))
plot(scot_BNG, axes=TRUE, las=1)
plot(grd_BNG, add=TRUE, lty=2)
text(coordinates(grdtxt_BNG),
   labels=parse(text=as.character(grdtxt_BNG$labels)))
par(opar)
crds <- matrix(data=c(9.05, 48.52), ncol=2)
spPoint <- SpatialPoints(coords=crds,
 proj4string=CRS("+proj=longlat +ellps=sphere +no_defs"))
a <- spTransform(spPoint, CRS(paste("+proj=ob_tran +o_proj=longlat",
 "+o_lon_p=-162 +o_lat_p=39.25 +lon_0=180 +ellps=sphere +no_defs")),
 use_ob_tran=TRUE)
a
#should be (-5.917698, -1.87195)
spTransform(a, CRS("+proj=longlat +ellps=sphere +no_defs"),
 use_ob_tran=TRUE)
try(spTransform(a, CRS(paste("+proj=tmerc +lat_0=0 +lon_0=9 +k=1",
"+x_0=3500000 +y_0=0 +ellps=bessel +units=m +no_defs")),
 use_ob_tran=TRUE))
spTransform(spPoint, CRS(paste("+proj=tmerc +lat_0=0 +lon_0=9 +k=1",
"+x_0=3500000 +y_0=0 +ellps=bessel +units=m +no_defs")))
spTransform(spTransform(a, CRS("+proj=longlat +ellps=sphere +no_defs"),
 use_ob_tran=TRUE), CRS(paste("+proj=tmerc +lat_0=0 +lon_0=9 +k=1",
"+x_0=3500000 +y_0=0 +ellps=bessel +units=m +no_defs")))
crds1 <- matrix(data=c(7, 51, 8, 52, 9, 52, 10, 51, 7, 51), ncol=2,
byrow=TRUE, dimnames=list(NULL, c("lon", "lat")));
crds2 <- matrix(data=c(8, 48, 9, 49, 11, 49, 9, 48, 8, 48), ncol=2,
byrow=TRUE, dimnames=list(NULL, c("lon", "lat")));
crds3 <- matrix(data=c(6, 47, 6, 55, 15, 55, 15, 47, 6, 47), ncol=2,
byrow=TRUE, dimnames=list(NULL, c("lon", "lat")));
spLines <- SpatialLines(list(Lines(list(Line(crds1), Line(crds2),
Line(crds3)), ID="a")));
spLines@proj4string <- CRS("+proj=longlat +ellps=sphere +no_defs");
bbox(spLines);
spLines_tr <- spTransform(spLines, CRS("+proj=ob_tran +o_proj=longlat
+o_lon_p=-162 +o_lat_p=39.25 +lon_0=180 +ellps=sphere +no_defs"),
use_ob_tran=TRUE);
bbox(spLines_tr)
bbox(spTransform(spLines_tr, CRS("+proj=longlat +ellps=sphere"),
 use_ob_tran=TRUE))
spPolygons <- SpatialPolygons(list(Polygons(list(Polygon(crds1),
Polygon(crds2), Polygon(crds3)), ID="a")));
spPolygons@proj4string <- CRS("+proj=longlat +ellps=sphere +no_defs");
bbox(spPolygons);
spPolygons_tr <- spTransform(spPolygons, CRS("+proj=ob_tran +o_proj=longlat
+o_lon_p=-162 +o_lat_p=39.25 +lon_0=180 +ellps=sphere +no_defs"),
use_ob_tran=TRUE);
bbox(spPolygons_tr)
bbox(spTransform(spPolygons_tr, CRS("+proj=longlat +ellps=sphere"),
 use_ob_tran=TRUE))
#added after posting by Martin Ivanov
data(nor2k)
summary(nor2k)
nor2kNGO <- spTransform(nor2k, CRS("+init=epsg:4273"))
summary(nor2kNGO)
all.equal(coordinates(nor2k)[,3], coordinates(nor2kNGO)[,3])
#added after posting by Don MacQueen 
crds <- cbind(c(-121.524764291826, -121.523480804667), c(37.6600366036405, 37.6543604613483))
ref <- cbind(c(1703671.30566227, 1704020.20113366), c(424014.398045834, 421943.708664294))
crs.step1.cf <- CRS(paste("+proj=lcc +lat_1=38.43333333333333",
 "+lat_2=37.06666666666667 +lat_0=36.5 +lon_0=-120.5",
 "+x_0=2000000.0 +y_0=500000.0 +ellps=GRS80 +units=us-ft +no_defs",
 "+towgs84=-0.991,1.9072,0.5129,0.025789908,0.0096501,0.0116599,0.0"))
locs.step1.cf <- spTransform(SpatialPoints(crds,
 proj4string=CRS("+proj=longlat +datum=WGS84")), crs.step1.cf)
suppressWarnings(proj4string(locs.step1.cf) <- CRS(paste("+proj=lcc",
"+lat_1=38.43333333333333 +lat_2=37.06666666666667 +lat_0=36.5",
"+lon_0=-120.5 +x_0=2000000.0 +y_0=500000.0 +ellps=GRS80 +units=us-ft",
"+no_defs +nadgrids=@null")))
locs.step2.cfb <- spTransform(locs.step1.cf, CRS("+init=epsg:26743"))
coordinates(locs.step2.cfb) - ref
all.equal(unname(coordinates(locs.step2.cfb)), ref)
# Test for UTM == TMERC (<= 4.9.2) or UTM == ETMERC (> 4.9.2)
nhh <- SpatialPointsDataFrame(matrix(c(5.304234, 60.422311), ncol=2),
 proj4string=CRS("+init=epsg:4326"), data=data.frame(office="RSB"))
nhh_utm_32N_P4 <- spTransform(nhh, CRS("+init=epsg:3044"))
nhh_tmerc_P4 <- spTransform(nhh, CRS(paste("+proj=tmerc +k=0.9996",
 "+lon_0=9 +x_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")))
nhh_etmerc_P4 <- spTransform(nhh, CRS(paste("+proj=etmerc +k=0.9996",
 "+lon_0=9 +x_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")))
all.equal(coordinates(nhh_utm_32N_P4), coordinates(nhh_tmerc_P4),
 tolerance=1e-9, scale=1)
# UTM == TMERC: PROJ4 <=4.9.2
all.equal(coordinates(nhh_utm_32N_P4), coordinates(nhh_etmerc_P4),
 tolerance=1e-9, scale=1)
# UTM == ETMERC: PROJ4 > 4.9.2
unis <- SpatialPointsDataFrame(matrix(c(15.653453, 78.222504), ncol=2),
 proj4string=CRS("+init=epsg:4326"), data=data.frame(office="UNIS"))
unis_utm_33N_P4 <- spTransform(unis, CRS("+init=epsg:3045"))
unis_tmerc_P4 <- spTransform(unis, CRS(paste("+proj=tmerc +k=0.9996 +lon_0=15",
 "+x_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")))
unis_etmerc_P4 <- spTransform(unis, CRS(paste("+proj=etmerc +k=0.9996",
 "+lon_0=15 +x_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")))
all.equal(coordinates(unis_utm_33N_P4), coordinates(unis_tmerc_P4),
 tolerance=1e-9, scale=1)
# UTM == TMERC: PROJ4 <=4.9.2
all.equal(coordinates(unis_utm_33N_P4), coordinates(unis_etmerc_P4),
 tolerance=1e-9, scale=1)
# UTM == ETMERC: PROJ4 > 4.9.2




