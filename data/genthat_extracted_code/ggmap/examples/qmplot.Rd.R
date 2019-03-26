library(ggmap)


### Name: qmplot
### Title: Quick map plot
### Aliases: qmplot

### ** Examples


## Not run: 
##D  # these are skipped to conserve R check time
##D 
##D qmplot(lon, lat, data = crime)
##D 
##D 
##D # only violent crimes
##D violent_crimes <- subset(crime,
##D   offense != "auto theft" &
##D   offense != "theft" &
##D   offense != "burglary"
##D )
##D 
##D # rank violent crimes
##D violent_crimes$offense <- factor(
##D   violent_crimes$offense,
##D   levels = c("robbery", "aggravated assault", "rape", "murder")
##D )
##D 
##D # restrict to downtown
##D violent_crimes <- subset(violent_crimes,
##D   -95.39681 <= lon & lon <= -95.34188 &
##D    29.73631 <= lat & lat <=  29.78400
##D )
##D 
##D theme_set(theme_bw())
##D 
##D qmplot(lon, lat, data = violent_crimes, colour = offense,
##D   size = I(3.5), alpha = I(.6), legend = "topleft")
##D 
##D qmplot(lon, lat, data = violent_crimes, geom = c("point","density2d"))
##D qmplot(lon, lat, data = violent_crimes) + facet_wrap(~ offense)
##D qmplot(lon, lat, data = violent_crimes, extent = "panel") + facet_wrap(~ offense)
##D qmplot(lon, lat, data = violent_crimes, extent = "panel", colour = offense, darken = .4) +
##D   facet_wrap(~ month)
##D 
##D 
##D 
##D 
##D qmplot(long, lat, xend = long + delta_long,
##D   color = I("red"), yend = lat + delta_lat, data = seals,
##D   geom = "segment", zoom = 5)
##D 
##D qmplot(long, lat, xend = long + delta_long, maptype = "watercolor",
##D   yend = lat + delta_lat, data = seals,
##D   geom = "segment", zoom = 6)
##D 
##D 
##D qmplot(lon, lat, data = wind, size = I(.5), alpha = I(.5)) +
##D   ggtitle("NOAA Wind Report Sites")
##D 
##D # thin down data set...
##D s <- seq(1, 227, 8)
##D thinwind <- subset(wind,
##D   lon %in% unique(wind$lon)[s] &
##D   lat %in% unique(wind$lat)[s]
##D )
##D 
##D # for some reason adding arrows to the following plot bugs
##D theme_set(theme_bw(18))
##D 
##D qmplot(lon, lat, data = thinwind, geom = "tile", fill = spd, alpha = spd,
##D     legend = "bottomleft") +
##D   geom_leg(aes(xend = lon + delta_lon, yend = lat + delta_lat)) +
##D   scale_fill_gradient2("Wind Speed\nand\nDirection",
##D     low = "green", mid = scales::muted("green"), high = "red") +
##D   scale_alpha("Wind Speed\nand\nDirection", range = c(.1, .75)) +
##D   guides(fill = guide_legend(), alpha = guide_legend())
##D 
##D 
##D 
##D 
##D ## kriging
##D ############################################################
##D # the below examples show kriging based on undeclared packages
##D # to better comply with CRAN's standards, we remove it from
##D # executing, but leave the code as a kind of case-study
##D # they also require the rgdal library
##D 
##D 
##D library(lattice)
##D library(sp)
##D library(rgdal)
##D 
##D # load in and format the meuse dataset (see bivand, pebesma, and gomez-rubio)
##D data(meuse)
##D coordinates(meuse) <- c("x", "y")
##D proj4string(meuse) <- CRS("+init=epsg:28992")
##D meuse <- spTransform(meuse, CRS("+proj=longlat +datum=WGS84"))
##D 
##D # plot
##D plot(meuse)
##D 
##D m <- data.frame(slot(meuse, "coords"), slot(meuse, "data"))
##D names(m)[1:2] <- c("lon", "lat")
##D 
##D qmplot(lon, lat, data = m)
##D qmplot(lon, lat, data = m, zoom = 14)
##D 
##D 
##D qmplot(lon, lat, data = m, size = zinc,
##D   zoom = 14, source = "google", maptype = "satellite",
##D   alpha = I(.75), color = I("green"),
##D   legend = "topleft", darken = .2
##D ) + scale_size("Zinc (ppm)")
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D # load in the meuse.grid dataset (looking toward kriging)
##D library(gstat)
##D data(meuse.grid)
##D coordinates(meuse.grid) <- c("x", "y")
##D proj4string(meuse.grid) <- CRS("+init=epsg:28992")
##D meuse.grid <- spTransform(meuse.grid, CRS("+proj=longlat +datum=WGS84"))
##D 
##D # plot it
##D plot(meuse.grid)
##D 
##D mg <- data.frame(slot(meuse.grid, "coords"), slot(meuse.grid, "data"))
##D names(mg)[1:2] <- c("lon", "lat")
##D 
##D qmplot(lon, lat, data = mg, shape = I(15), zoom = 14, legend = "topleft") +
##D   geom_point(aes(size = zinc), data = m, color = "green") +
##D   scale_size("Zinc (ppm)")
##D 
##D 
##D 
##D # interpolate at unobserved locations (i.e. at meuse.grid points)
##D # pre-define scale for consistency
##D scale <- scale_color_gradient("Predicted\nZinc (ppm)",
##D   low = "green", high = "red", lim = c(100, 1850)
##D )
##D 
##D 
##D 
##D # inverse distance weighting
##D idw <- idw(log(zinc) ~ 1, meuse, meuse.grid, idp = 2.5)
##D mg$idw <- exp(slot(idw, "data")$var1.pred)
##D 
##D qmplot(lon, lat, data = mg, shape = I(15), color = idw,
##D   zoom = 14, legend = "topleft", alpha = I(.75), darken = .4
##D ) + scale
##D 
##D 
##D 
##D # linear regression
##D lin <- krige(log(zinc) ~ 1, meuse, meuse.grid, degree = 1)
##D mg$lin <- exp(slot(idw, "lin")$var1.pred)
##D 
##D qmplot(lon, lat, data = mg, shape = I(15), color = lin,
##D   zoom = 14, legend = "topleft", alpha = I(.75), darken = .4
##D ) + scale
##D 
##D 
##D 
##D # trend surface analysis
##D tsa <- krige(log(zinc) ~ 1, meuse, meuse.grid, degree = 2)
##D mg$tsa <- exp(slot(tsa, "data")$var1.pred)
##D 
##D qmplot(lon, lat, data = mg, shape = I(15), color = tsa,
##D   zoom = 14, legend = "topleft", alpha = I(.75), darken = .4
##D ) + scale
##D 
##D 
##D 
##D # ordinary kriging
##D vgram <- variogram(log(zinc) ~ 1, meuse)   # plot(vgram)
##D vgramFit <- fit.variogram(vgram, vgm(1, "Exp", .2, .1))
##D ordKrige <- krige(log(zinc) ~ 1, meuse, meuse.grid, vgramFit)
##D mg$ordKrige <- exp(slot(ordKrige, "data")$var1.pred)
##D 
##D qmplot(lon, lat, data = mg, shape = I(15), color = ordKrige,
##D   zoom = 14, legend = "topleft", alpha = I(.75), darken = .4
##D ) + scale
##D 
##D 
##D 
##D # universal kriging
##D vgram <- variogram(log(zinc) ~ 1, meuse) # plot(vgram)
##D vgramFit <- fit.variogram(vgram, vgm(1, "Exp", .2, .1))
##D univKrige <- krige(log(zinc) ~ sqrt(dist), meuse, meuse.grid, vgramFit)
##D mg$univKrige <- exp(slot(univKrige, "data")$var1.pred)
##D 
##D qmplot(lon, lat, data = mg, shape = I(15), color = univKrige,
##D   zoom = 14, legend = "topleft", alpha = I(.75), darken = .4
##D ) + scale
##D 
##D 
##D 
##D # adding observed data layer
##D qmplot(lon, lat, data = mg, shape = I(15), color = univKrige,
##D   zoom = 14, legend = "topleft", alpha = I(.75), darken = .4
##D ) +
##D   geom_point(
##D     aes(x = lon, y = lat, size = zinc),
##D     data = m, shape = 1, color = "black"
##D   ) +
##D   scale +
##D   scale_size("Observed\nLog Zinc")
##D 
##D 
##D 
##D 
##D 
##D 
## End(Not run) # end dontrun




