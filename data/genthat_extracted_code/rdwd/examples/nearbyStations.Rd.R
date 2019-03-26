library(rdwd)


### Name: nearbyStations
### Title: Find DWD stations close to given coordinates
### Aliases: nearbyStations

### ** Examples


## Not run: 
##D ## entirely excluded from CRAN checks 2018 because of computing time
##D ## Sections 3:5 were already excluded because of map downloads
##D 
##D # 1. Basic usage ----
##D 
##D m <- nearbyStations(49.211784, 9.812475, radius=30,
##D     res=c("daily","hourly"), var= c("precipitation","more_precip","kl") ,
##D     mindate=20160530, statname="Braunsbach catchment center")
##D 
##D 
##D # 2. Remove duplicates ----
##D 
##D # if kl and more_precip are both available, keep only more_precip:
##D library("berryFunctions")
##D m <- sortDF(m, "var")
##D m <- m[!duplicated(paste0(m$Stations_id, m$res)),]
##D m <- sortDF(m, "res")
##D m <- sortDF(m, "dist", decreasing=FALSE)
##D rownames(m) <- NULL
##D 
##D ## 3. Interactive map ----
##D 
##D library(leaflet)
##D m$col <- "red" ; m$col[1] <- "blue"
##D leaflet(m) %>% addTiles() %>%
##D   addCircles(lng=9.812475, lat=49.211784, radius=30e3) %>%
##D   addCircleMarkers(~geoLaenge, ~geoBreite, col=~col, popup=~Stationsname)
##D 
##D 
##D ## 4. Download and process data ----
##D 
##D # Download and process data for the stations, create a list of data.frames:
##D prec <- dataDWD(m$url) # once downloaded, will only read
##D names(prec) <- m$Stations_id[-1]
##D prec29 <- sapply(prec[m$res[-1]=="daily"], function(x)
##D          x[x$MESS_DATUM==as.POSIXct(as.Date("2016-05-29")), c("STATIONS_ID","NIEDERSCHLAGSHOEHE")])
##D prec29 <- data.frame(Stations_id=unlist(prec29[1,]), precsum=unlist(prec29[2,]))
##D prec29 <- merge(prec29, m[m$res=="daily",c(1,4:7,14)], sort=FALSE)
##D View(prec29)
##D 
##D 
##D ## 5. Plot rainfall sum on map
##D 
##D plot(geoBreite~geoLaenge, data=m, asp=1)
##D textField(prec29$geoLaenge, prec29$geoBreite, prec29$precsum, col=2)
##D 
##D # If OSMscale installation fails, go to:
##D browseURL("https://github.com/brry/OSMscale#installation")
##D # install.packages("OSMscale")
##D library(OSMscale)
##D map <- pointsMap(geoBreite,geoLaenge, data=m, type="maptoolkit-topo")
##D pp <- projectPoints("geoBreite", "geoLaenge", data=prec29, to=map$tiles[[1]]$projection)
##D prec29 <- cbind(prec29,pp) ; rm(pp)
##D plot(map, removeMargin=FALSE)
##D scaleBar(map, cex=1.5, type="line", y=0.82)
##D title(main="Rainfall sum  2016-05-29  7AM-7AM  [mm]", line=-1)
##D textField(prec29$x, prec29$y, round(prec29$precsum), font=2, cex=1.5)
## End(Not run)




