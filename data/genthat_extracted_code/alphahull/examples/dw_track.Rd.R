library(alphahull)


### Name: dw_track
### Title: RBM-sausage calculation of tracking data
### Aliases: dw_track
### Keywords: nonparametric

### ** Examples

## Not run: 
##D library(move)
##D library(ggmap)
##D # Data from Movebank
##D # Study Name: Dunn Ranch Bison Tracking Project
##D # Principal Investigator: Stephen Blake, Randy Arndt, Doug Ladd
##D # Max Planck Institute for Ornithology Radolfzell Germany
##D study <- "Dunn Ranch Bison Tracking Project" 
##D cainfo <- system.file("CurlSSL", "cacert.pem", package = "RCurl")
##D options(RCurlOptions = list(verbose = FALSE, capath = cainfo, ssl.verifypeer = FALSE))
##D # Login to movebank (first create the login object) 
##D curl <- movebankLogin(username = "xxx", password = "zzz") 
##D # Downloads study stored in Movebank
##D track <- getMovebankData(study = study, login = curl) 
##D dat <- track@data[track@data[, "deployment_id"] == 13848432,]
##D # Map of animal locations 
##D bbox <- ggmap::make_bbox(dat[,"location_long"], dat[,"location_lat"], f = 0.3) 
##D map_loc <- get_map(location = bbox, source = "google", maptype = 'satellite')  
##D map <- ggmap(map_loc, extent = 'panel', maprange=FALSE) 
##D p <- map + geom_path(data = dat, aes(x = location_long, y = location_lat), col=2, size=0.3)
##D p
##D ah_dw <- dw_track(x = dat[, c("location_long", "location_lat")], eps = 0.001)
##D p + ah_dw
## End(Not run)



