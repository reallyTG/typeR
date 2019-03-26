library(ggmap)


### Name: ggmap
### Title: Plot a ggmap object
### Aliases: ggmap ggmap-package package-ggmap

### ** Examples


## Not run: 
##D  map queries drag R CMD check
##D 
##D 
##D ## extents and legends
##D ##################################################
##D hdf <- get_map("houston, texas")
##D ggmap(hdf, extent = "normal")
##D ggmap(hdf) # extent = "panel", note qmap defaults to extent = "device"
##D ggmap(hdf, extent = "device")
##D 
##D 
##D 
##D # make some fake spatial data
##D mu <- c(-95.3632715, 29.7632836); nDataSets <- sample(4:10,1)
##D chkpts <- NULL
##D for(k in 1:nDataSets){
##D   a <- rnorm(2); b <- rnorm(2);
##D   si <- 1/3000 * (outer(a,a) + outer(b,b))
##D   chkpts <- rbind(
##D     chkpts,
##D     cbind(MASS::mvrnorm(rpois(1,50), jitter(mu, .01), si), k)
##D   )
##D }
##D chkpts <- data.frame(chkpts)
##D names(chkpts) <- c("lon", "lat","class")
##D chkpts$class <- factor(chkpts$class)
##D qplot(lon, lat, data = chkpts, colour = class)
##D 
##D # show it on the map
##D ggmap(hdf, extent = "normal") +
##D   geom_point(aes(x = lon, y = lat, colour = class), data = chkpts, alpha = .5)
##D 
##D ggmap(hdf) +
##D   geom_point(aes(x = lon, y = lat, colour = class), data = chkpts, alpha = .5)
##D 
##D ggmap(hdf, extent = "device") +
##D   geom_point(aes(x = lon, y = lat, colour = class), data = chkpts, alpha = .5)
##D 
##D theme_set(theme_bw())
##D ggmap(hdf, extent = "device") +
##D   geom_point(aes(x = lon, y = lat, colour = class), data = chkpts, alpha = .5)
##D 
##D ggmap(hdf, extent = "device", legend = "topleft") +
##D   geom_point(aes(x = lon, y = lat, colour = class), data = chkpts, alpha = .5)
##D 
##D # qmplot is great for this kind of thing...
##D qmplot(lon, lat, data = chkpts, color = class, darken = .6)
##D qmplot(lon, lat, data = chkpts, geom = "density2d", color = class, darken = .6)
##D 
##D ## maprange
##D ##################################################
##D 
##D hdf <- get_map()
##D mu <- c(-95.3632715, 29.7632836)
##D points <- data.frame(MASS::mvrnorm(1000, mu = mu, diag(c(.1, .1))))
##D names(points) <- c("lon", "lat")
##D points$class <- sample(c("a","b"), 1000, replace = TRUE)
##D 
##D ggmap(hdf) + geom_point(data = points) # maprange built into extent = panel, device
##D ggmap(hdf) + geom_point(aes(colour = class), data = points)
##D 
##D ggmap(hdf, extent = "normal") + geom_point(data = points)
##D # note that the following is not the same as extent = panel
##D ggmap(hdf, extent = "normal", maprange = TRUE) + geom_point(data = points)
##D 
##D # and if you need your data to run off on a extent = device (legend included)
##D ggmap(hdf, extent = "normal", maprange = TRUE) +
##D   geom_point(aes(colour = class), data = points) +
##D   theme_nothing(legend = TRUE) + theme(legend.position = "right")
##D 
##D # again, qmplot is probably more useful
##D qmplot(lon, lat, data = points, color = class, darken = .4, alpha = I(.6))
##D qmplot(lon, lat, data = points, color = class, darken = 0,
##D   maptype = "toner-lite"
##D )
##D 
##D ## cool examples
##D ##################################################
##D 
##D # contour overlay
##D ggmap(get_map(maptype = "satellite"), extent = "device") +
##D   stat_density2d(aes(x = lon, y = lat, colour = class), data = chkpts, bins = 5)
##D 
##D 
##D # adding additional content
##D library(grid)
##D baylor <- get_map("baylor university", zoom = 15, maptype = "satellite")
##D ggmap(baylor)
##D 
##D # use gglocator to find lon/lat"s of interest
##D (clicks <- clicks <- gglocator(2) )
##D expand.grid(lon = clicks$lon, lat = clicks$lat)
##D 
##D ggmap(baylor) + theme_bw() +
##D   annotate("segment", x=-97.110, xend=-97.1188, y=31.5450, yend=31.5485,
##D     colour=I("red"), arrow = arrow(length=unit(0.3,"cm")), size = 1.5) +
##D   annotate("rect", xmin=-97.122, ymin=31.5439, xmax=-97.1050, ymax=31.5452,
##D     fill = I("white"), alpha = I(3/4)) +
##D   annotate("text", x=-97.113, y=31.5445, label = "Department of Statistical Science",
##D     colour = I("red"), size = 3.5) +
##D   labs(x = "Longitude", y = "Latitude") + ggtitle("Baylor University")
##D 
##D 
##D 
##D baylor <- get_map("baylor university", zoom = 16, maptype = "satellite")
##D 
##D ggmap(baylor, extent = "panel") +
##D   annotate("segment", x=-97.1175, xend=-97.1188, y=31.5449, yend=31.5485,
##D     colour=I("red"), arrow = arrow(length=unit(0.4,"cm")), size = 1.5) +
##D   annotate("rect", xmin=-97.122, ymin=31.5441, xmax=-97.113, ymax=31.5449,
##D     fill = I("white"), alpha = I(3/4)) +
##D   annotate("text", x=-97.1175, y=31.5445, label = "Department of Statistical Science",
##D     colour = I("red"), size = 4)
##D 
##D 
##D 
##D # a shapefile like layer
##D data(zips)
##D ggmap(get_map(maptype = "satellite", zoom = 8), extent = "device") +
##D   geom_polygon(aes(x = lon, y = lat, group = plotOrder),
##D     data = zips, colour = NA, fill = "red", alpha = .2) +
##D   geom_path(aes(x = lon, y = lat, group = plotOrder),
##D     data = zips, colour = "white", alpha = .4, size = .4)
##D 
##D library(plyr)
##D zipsLabels <- ddply(zips, .(zip), function(df){
##D   df[1,c("area", "perimeter", "zip", "lonCent", "latCent")]
##D })
##D ggmap(get_map(maptype = "satellite", zoom = 9),
##D     extent = "device", legend = "none", darken = .5) +
##D   geom_text(aes(x = lonCent, y = latCent, label = zip, size = area),
##D     data = zipsLabels, colour = I("red")) +
##D   scale_size(range = c(1.5,6))
##D 
##D qmplot(lonCent, latCent, data = zipsLabels, geom = "text",
##D   label = zip, size = area, maptype = "toner-lite", color = I("red")
##D )
##D 
##D 
##D ## crime data example
##D ##################################################
##D 
##D # only violent crimes
##D violent_crimes <- subset(crime,
##D   offense != "auto theft" &
##D   offense != "theft" &
##D   offense != "burglary"
##D )
##D 
##D # rank violent crimes
##D violent_crimes$offense <-
##D   factor(violent_crimes$offense,
##D     levels = c("robbery", "aggravated assault",
##D       "rape", "murder")
##D   )
##D 
##D # restrict to downtown
##D violent_crimes <- subset(violent_crimes,
##D   -95.39681 <= lon & lon <= -95.34188 &
##D    29.73631 <= lat & lat <=  29.78400
##D )
##D 
##D 
##D # get map and bounding box
##D theme_set(theme_bw(16))
##D HoustonMap <- qmap("houston", zoom = 14, color = "bw",
##D   extent = "device", legend = "topleft")
##D HoustonMap <- ggmap(
##D   get_map("houston", zoom = 14, color = "bw"),
##D   extent = "device", legend = "topleft"
##D )
##D 
##D # the bubble chart
##D HoustonMap +
##D    geom_point(aes(x = lon, y = lat, colour = offense, size = offense), data = violent_crimes) +
##D    scale_colour_discrete("Offense", labels = c("Robery","Aggravated Assault","Rape","Murder")) +
##D    scale_size_discrete("Offense", labels = c("Robery","Aggravated Assault","Rape","Murder"),
##D      range = c(1.75,6)) +
##D    guides(size = guide_legend(override.aes = list(size = 6))) +
##D    theme(
##D      legend.key.size = grid::unit(1.8,"lines"),
##D      legend.title = element_text(size = 16, face = "bold"),
##D      legend.text = element_text(size = 14)
##D    ) +
##D    labs(colour = "Offense", size = "Offense")
##D 
##D 
##D # doing it with qmplot is even easier
##D qmplot(lon, lat, data = violent_crimes, maptype = "toner-lite",
##D   color = offense, size = offense, legend = "topleft"
##D )
##D 
##D # or, with styling:
##D qmplot(lon, lat, data = violent_crimes, maptype = "toner-lite",
##D   color = offense, size = offense, legend = "topleft"
##D ) +
##D   scale_colour_discrete("Offense", labels = c("Robery","Aggravated Assault","Rape","Murder")) +
##D   scale_size_discrete("Offense", labels = c("Robery","Aggravated Assault","Rape","Murder"),
##D     range = c(1.75,6)) +
##D   guides(size = guide_legend(override.aes = list(size = 6))) +
##D   theme(
##D     legend.key.size = grid::unit(1.8,"lines"),
##D     legend.title = element_text(size = 16, face = "bold"),
##D     legend.text = element_text(size = 14)
##D   ) +
##D   labs(colour = "Offense", size = "Offense")
##D 
##D 
##D 
##D 
##D 
##D 
##D # a contour plot
##D HoustonMap +
##D   stat_density2d(aes(x = lon, y = lat, colour = offense),
##D     size = 3, bins = 2, alpha = 3/4, data = violent_crimes) +
##D    scale_colour_discrete("Offense", labels = c("Robery","Aggravated Assault","Rape","Murder")) +
##D    theme(
##D      legend.text = element_text(size = 15, vjust = .5),
##D      legend.title = element_text(size = 15,face="bold"),
##D      legend.key.size = grid::unit(1.8,"lines")
##D    )
##D 
##D 
##D 
##D # 2d histogram...
##D HoustonMap +
##D   stat_bin2d(aes(x = lon, y = lat, colour = offense, fill = offense),
##D     size = .5, bins = 30, alpha = 2/4, data = violent_crimes) +
##D    scale_colour_discrete("Offense",
##D      labels = c("Robery","Aggravated Assault","Rape","Murder"),
##D      guide = FALSE) +
##D    scale_fill_discrete("Offense", labels = c("Robery","Aggravated Assault","Rape","Murder")) +
##D    theme(
##D      legend.text = element_text(size = 15, vjust = .5),
##D      legend.title = element_text(size = 15,face="bold"),
##D      legend.key.size = grid::unit(1.8,"lines")
##D    )
##D 
##D 
##D # ... with hexagonal bins
##D HoustonMap +
##D   stat_binhex(aes(x = lon, y = lat, colour = offense, fill = offense),
##D     size = .5, binwidth = c(.00225,.00225), alpha = 2/4, data = violent_crimes) +
##D    scale_colour_discrete("Offense",
##D      labels = c("Robery","Aggravated Assault","Rape","Murder"),
##D      guide = FALSE) +
##D    scale_fill_discrete("Offense", labels = c("Robery","Aggravated Assault","Rape","Murder")) +
##D    theme(
##D      legend.text = element_text(size = 15, vjust = .5),
##D      legend.title = element_text(size = 15,face="bold"),
##D      legend.key.size = grid::unit(1.8,"lines")
##D    )
##D 
##D 
##D 
##D # changing gears (get a color map)
##D houston <- get_map("houston", zoom = 14)
##D HoustonMap <- ggmap(houston, extent = "device", legend = "topleft")
##D 
##D # a filled contour plot...
##D HoustonMap +
##D   stat_density2d(aes(x = lon, y = lat, fill = ..level.., alpha = ..level..),
##D     size = 2, bins = 4, data = violent_crimes, geom = "polygon") +
##D   scale_fill_gradient("Violent\nCrime\nDensity") +
##D   scale_alpha(range = c(.4, .75), guide = FALSE) +
##D   guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10))
##D 
##D # ... with an insert
##D 
##D overlay <- stat_density2d(aes(x = lon, y = lat, fill = ..level.., alpha = ..level..),
##D     bins = 4, geom = "polygon", data = violent_crimes)
##D 
##D 
##D HoustonMap +
##D   stat_density2d(aes(x = lon, y = lat, fill = ..level.., alpha = ..level..),
##D     bins = 4, geom = "polygon", data = violent_crimes) +
##D   scale_fill_gradient("Violent\nCrime\nDensity") +
##D   scale_alpha(range = c(.4, .75), guide = FALSE) +
##D   guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) +
##D   inset(
##D     grob = ggplotGrob(ggplot() + overlay +
##D       scale_fill_gradient("Violent\nCrime\nDensity") +
##D       scale_alpha(range = c(.4, .75), guide = FALSE) +
##D       theme_inset()
##D     ),
##D     xmin = attr(houston,"bb")$ll.lon +
##D       (7/10) * (attr(houston,"bb")$ur.lon - attr(houston,"bb")$ll.lon),
##D     xmax = Inf,
##D     ymin = -Inf,
##D     ymax = attr(houston,"bb")$ll.lat +
##D       (3/10) * (attr(houston,"bb")$ur.lat - attr(houston,"bb")$ll.lat)
##D   )
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ## more examples
##D ##################################################
##D 
##D # you can layer anything on top of the maps (even meaningless stuff)
##D df <- data.frame(
##D   lon = rep(seq(-95.39, -95.35, length.out = 8), each = 20),
##D   lat = sapply(
##D     rep(seq(29.74, 29.78, length.out = 8), each = 20),
##D     function(x) rnorm(1, x, .002)
##D   ),
##D   class = rep(letters[1:8], each = 20)
##D )
##D 
##D qplot(lon, lat, data = df, geom = "boxplot", fill = class)
##D 
##D HoustonMap +
##D   geom_boxplot(aes(x = lon, y = lat, fill = class), data = df)
##D 
##D 
##D 
##D 
##D ## the base_layer argument - faceting
##D ##################################################
##D 
##D df <- data.frame(
##D   x = rnorm(1000, -95.36258, .2),
##D   y = rnorm(1000,  29.76196, .2)
##D )
##D 
##D # no apparent change because ggmap sets maprange = TRUE with extent = "panel"
##D ggmap(get_map(), base_layer = ggplot(aes(x = x, y = y), data = df)) +
##D   geom_point(colour = "red")
##D 
##D # ... but there is a difference
##D ggmap(get_map(), base_layer = ggplot(aes(x = x, y = y), data = df), extent = "normal") +
##D   geom_point(colour = "red")
##D 
##D # maprange can fix it (so can extent = "panel")
##D ggmap(get_map(), maprange = TRUE, extent = "normal",
##D   base_layer = ggplot(aes(x = x, y = y), data = df)) +
##D   geom_point(colour = "red")
##D 
##D # base_layer makes faceting possible
##D df <- data.frame(
##D   x = rnorm(10*100, -95.36258, .075),
##D   y = rnorm(10*100,  29.76196, .075),
##D   year = rep(paste("year",format(1:10)), each = 100)
##D )
##D ggmap(get_map(), base_layer = ggplot(aes(x = x, y = y), data = df)) +
##D   geom_point() +  facet_wrap(~ year)
##D 
##D ggmap(get_map(), base_layer = ggplot(aes(x = x, y = y), data = df), extent = "device") +
##D   geom_point() +  facet_wrap(~ year)
##D 
##D qmplot(x, y, data = df)
##D qmplot(x, y, data = df, facets = ~ year)
##D 
##D 
##D ## neat faceting examples
##D ##################################################
##D 
##D # simulated example
##D df <- data.frame(
##D   x = rnorm(10*100, -95.36258, .05),
##D   y = rnorm(10*100,  29.76196, .05),
##D   year = rep(paste("year",format(1:10)), each = 100)
##D )
##D for(k in 0:9){
##D   df$x[1:100 + 100*k] <- df$x[1:100 + 100*k] + sqrt(.05)*cos(2*pi*k/10)
##D   df$y[1:100 + 100*k] <- df$y[1:100 + 100*k] + sqrt(.05)*sin(2*pi*k/10)
##D }
##D 
##D ggmap(get_map(),
##D   base_layer = ggplot(aes(x = x, y = y), data = df)) +
##D   stat_density2d(aes(fill = ..level.., alpha = ..level..),
##D     bins = 4, geom = "polygon") +
##D   scale_fill_gradient2(low = "white", mid = "orange", high = "red", midpoint = 10) +
##D   scale_alpha(range = c(.2, .75), guide = FALSE) +
##D   facet_wrap(~ year)
##D 
##D 
##D 
##D # crime example by month
##D levels(violent_crimes$month) <- paste(
##D   toupper(substr(levels(violent_crimes$month),1,1)),
##D   substr(levels(violent_crimes$month),2,20), sep = ""
##D )
##D houston <- get_map(location = "houston", zoom = 14, source = "osm", color = "bw")
##D HoustonMap <- ggmap(houston,
##D   base_layer = ggplot(aes(x = lon, y = lat), data = violent_crimes)
##D   )
##D 
##D HoustonMap +
##D   stat_density2d(aes(x = lon, y = lat, fill = ..level.., alpha = ..level..),
##D     bins = I(5), geom = "polygon", data = violent_crimes) +
##D   scale_fill_gradient2("Violent\nCrime\nDensity",
##D     low = "white", mid = "orange", high = "red", midpoint = 500) +
##D   labs(x = "Longitude", y = "Latitude") + facet_wrap(~ month) +
##D   scale_alpha(range = c(.2, .55), guide = FALSE) +
##D   ggtitle("Violent Crime Contour Map of Downtown Houston by Month") +
##D   guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10))
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ## darken argument
##D ##################################################
##D ggmap(get_map())
##D ggmap(get_map(), darken = .5)
##D ggmap(get_map(), darken = c(.5,"white"))
##D ggmap(get_map(), darken = c(.5,"red")) # silly, but possible
##D 
##D 
## End(Not run)



