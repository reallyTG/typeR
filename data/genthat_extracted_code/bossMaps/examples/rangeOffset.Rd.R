library(bossMaps)


### Name: rangeOffset
### Title: Generate a spatial map of an expert map (with decay) to be used
###   as an offset
### Aliases: rangeOffset

### ** Examples

## Not run: 
##D   library(raster)
##D   library(ggplot2)
##D   
##D   data("Tinamus_solitarius_points")
##D   data("Tinamus_solitarius_range")
##D   
##D   ## Define global modeling grid
##D   domain = raster(
##D     xmn = -180,
##D     xmx = 180,
##D     ymn = -90,
##D     ymx = 90,
##D     crs = "+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs",
##D     resolution = 10 / 360,
##D     vals = NULL
##D   )
##D   
##D   ## turn on raster progress bar
##D   rasterOptions(progress = "")
##D   
##D   ## calculate distance-to-range: this is slow but only has to
##D   ## be done once per species.  Can speed it up by increasing
##D   ## 'fact' (at the expense of reduced accuracy).
##D   range = Tinamus_solitarius_range
##D   points=Tinamus_solitarius_points
##D   
##D   rdist = rangeDist(range=range,
##D                     domain=domain,
##D                     domainkm = 100,
##D                     mask = FALSE,
##D                     fact = 10)
##D   
##D   ## Mask out undesired areas (ocean, etc.)  Typically you would
##D   ## do this using your environmental data, but here we'll just
##D   ## use a coastline polygon from the maps package
##D #    land = map(
##D #    interior = F,
##D #    fill = T,
##D #    xlim = bbox(rdist)[1, ],
##D #    ylim = bbox(rdist)[2, ]
##D #  )
##D #  land = map2SpatialPolygons(land, IDs = land$names)
##D #  rdist = mask(rdist, land)
##D   
##D   ## calculate frequency table of distances
##D   dists = freq(rdist)
##D   
##D   ### plot to visualize potential decay parameters
##D   vars = expand.grid(
##D     rate = c(0, 0.03, 0.05, 0.1, 10),
##D     skew = c(0.2,
##D              0.4),
##D     shift = 0,
##D     stringsAsFactors = FALSE
##D   )
##D   x = seq(-150, 300, len = 1000)
##D   
##D   ## Calculate all the curves
##D   erd = do.call(rbind, lapply(1:nrow(vars), function(i) {
##D     y = logistic(x, parms = unlist(c(
##D       lower = 0, upper = 1, vars[i, ]
##D     )))
##D     return(cbind.data.frame(
##D       group = i,
##D       c(vars[i, ]),
##D       x = x,
##D       y = y
##D     ))
##D   }))
##D   
##D   ## plot it
##D   ggplot(erd,
##D          aes(
##D            x = x,
##D            y = y,
##D            linetype = as.factor(skew),
##D            colour = as.factor(rate),
##D            group = group
##D          )) + 
##D     geom_vline(aes(xintercept=0),
##D                colour = "red") + geom_line() +
##D     xlab("Prior value (not normalized)") +
##D     xlab("Distance to range edge (km)")
##D   
##D   
##D   ## calculate the expert range prior
##D   expert = rangeOffset(
##D     rdist,
##D     dists = dists,
##D     parms = c(
##D       prob = 0.9,
##D       rate = 0.05,
##D       skew = 0.4,
##D       shift = 0
##D     ),
##D     normalize = TRUE,
##D     verbose = TRUE
##D   )
##D   
##D   ## View the metadata
##D   metadata(expert)$parms
##D   
##D   ## plot it
##D   plot(expert)
## End(Not run)



