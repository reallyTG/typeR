### R code from vignette source 'move.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
library("move")


###################################################
### code chunk number 2: importData
###################################################
leroy <- move(system.file("extdata","leroy.csv.gz",package="move"))


###################################################
### code chunk number 3: importNonMovebank
###################################################
data <- read.csv(system.file("extdata","leroy.csv.gz",package="move"))
leroy <- move(x=data$location.long, y=data$location.lat, time=as.POSIXct(data$timestamp, 
            format="%Y-%m-%d %H:%M:%OS", tz="UTC"), proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), 
            data=data, animal=data$individual.local.identifier, sensor=data$sensor)
leroy


###################################################
### code chunk number 4: StackMoveObjects
###################################################
data(ricky)
data(leroy)
list <- list(leroy, ricky)
stack <- moveStack(list)
stack


###################################################
### code chunk number 5: SplitMoveStacks
###################################################
unstacked <- split(stack)
#use show(unstacked) to see all objects of unstacked


###################################################
### code chunk number 6: showFunction
###################################################
show(leroy)


###################################################
### code chunk number 7: nlocs
###################################################
n.locs(ricky)


###################################################
### code chunk number 8: timelag
###################################################
head(timeLag(leroy, units="mins"))


###################################################
### code chunk number 9: timestamps
###################################################
head(timestamps(leroy))


###################################################
### code chunk number 10: fig1plot
###################################################
par(mfcol=1:2)
plot(leroy, type="o", col=3, lwd=2, pch=20, xlab="location_long", 
     ylab="location_lat")
plot(stack, col=c(6,5), lwd=2, xlab="location_long", ylab="location_lat")


###################################################
### code chunk number 11: figTrack
###################################################
par(mfcol=1:2)
plot(leroy, type="o", col=3, lwd=2, pch=20, xlab="location_long", 
     ylab="location_lat")
plot(stack, col=c(6,5), lwd=2, xlab="location_long", ylab="location_lat")


###################################################
### code chunk number 12: googleplotPrep
###################################################
require(ggmap) #these packages are necessary to work with google maps
require(mapproj)
leroy_df <- as(leroy, "data.frame")


###################################################
### code chunk number 13: tmp (eval = FALSE)
###################################################
## m <- get_map(bbox(extent(leroy)*1.1), source="stamen", zoom=12)


###################################################
### code chunk number 14: tmp2
###################################################
load("a.Rdata")
#load(system.file("doc","a.Rdata",package="move"))


###################################################
### code chunk number 15: googleplot
###################################################
ggmap(m)+geom_path(data=leroy_df, aes(x=location.long, y=location.lat))


###################################################
### code chunk number 16: tmp3i (eval = FALSE)
###################################################
## require(ggmap) #these packages are necessary to work with google maps
## require(mapproj)
## leroy_df <- as(leroy, "data.frame")
## m <- get_map(bbox(extent(leroy)*1.1), source="stamen", zoom=12)
## ggmap(m)+geom_path(data=leroy_df, aes(x=location.long, y=location.lat))


###################################################
### code chunk number 17: figGoogle
###################################################
ggmap(m)+geom_path(data=leroy_df, aes(x=location.long, y=location.lat))


###################################################
### code chunk number 18: subset
###################################################
ricky[1:25]
stack[800:1100] #see the names of both animals in second last row


###################################################
### code chunk number 19: as
###################################################
head(as(leroy, "data.frame"))


###################################################
### code chunk number 20: transformData
###################################################
proj4string(leroy)
leroy_t <- spTransform(x=leroy, CRSobj="+proj=aeqd +ellps=WGS84", center=TRUE)  
proj4string(leroy_t)


###################################################
### code chunk number 21: burstTrack
###################################################
behavior <- c(rep(1:8,each=111), rep(1, 30))
leroy_b <- move::burst(x=leroy, f=behavior)
class(leroy_b)


###################################################
### code chunk number 22: figburst
###################################################
par(mfrow=c(2,2))
plot(leroy_b, type="l", lwd=2)
plot(midPoint(coordinates(leroy_b)[-n.locs(leroy_b), ], 
              coordinates(leroy_b)[-1, ]), col=leroy_b@burstId, pch=20)
plotBursts(leroy_b, breaks=3, add=FALSE, pch=19)


###################################################
### code chunk number 23: dbbmm
###################################################
r <- spTransform(ricky[1:500,], center=T)
ricky_dbbmm <- brownian.bridge.dyn(r, dimSize=150, location.error=23, 
                                   ext=1, time.step=60, margin=13)


###################################################
### code chunk number 24: showdbbmm
###################################################
ricky_dbbmm
raster(ricky_dbbmm)


###################################################
### code chunk number 25: fig1
###################################################
par(mfrow=c(1,2))
plot(ricky_dbbmm, xlab="location_long", ylab="location_lat")
plot(ricky_dbbmm, xlab="location_long", ylab="location_lat")
lines(spTransform(ricky[1:500,], center=TRUE), col=3, lwd=2)
#plot(ricky_dbbmm, xlab="location_long", ylab="location_lat")
#points(spTransform(ricky[1:500, ], center=TRUE), col=8)


###################################################
### code chunk number 26: contour
###################################################
plot(ricky_dbbmm, xlab="location_long", ylab="location_lat")
contour(ricky_dbbmm, levels=c(.5, .95), col=c(6,2), add=TRUE, lwd=2)


###################################################
### code chunk number 27: areaSize
###################################################
ricky_cont <- getVolumeUD(ricky_dbbmm)
ricky_cont <- ricky_cont<=.95
area <- sum(values(ricky_cont))
area


###################################################
### code chunk number 28: saveLoad (eval = FALSE)
###################################################
## save(x=ricky_dbbmm, file="~/Desktop/test.RData")
## rm(ricky_dbbmm)
## load(file="~/Desktop/test.RData")


###################################################
### code chunk number 29: saveKML (eval = FALSE)
###################################################
## #install.packages('plotKML')
## require(plotKML)
## kml(leroy)


###################################################
### code chunk number 30: hrBootstrap
###################################################
hrBootstrap(x=leroy, rep=25, unin='km', unout='km2')


