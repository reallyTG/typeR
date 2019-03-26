library(graticule)


### Name: graticule
### Title: graticule: graticule lines for maps
### Aliases: graticule graticule-package

### ** Examples

## No test: ## Not run: 
##D library(rgdal)
##D x <- as.matrix(expand.grid(x = seq(100, 240, by = 15), y = seq(-85, -30, by = 15)))
##D prj <- "+proj=laea +lon_0=180 +lat_0=-70 +x_0=0 +y_0=0 +ellps=WGS84 +units=m +no_defs "
##D px <- project(x, prj)
##D g <- graticule(unique(x[,1]), unique(x[,2]))
##D pg <- spTransform(g, CRS(prj))
##D plot(px, type = "n")
##D plot(pg, add = TRUE)
##D 
##D g2 <- graticule(unique(x[,1]), unique(x[,2]), ylim = c(-90, 0), xlim = c(110, 250))
##D pg2 <- spTransform(g2, CRS(prj))
##D plot(px, type = "n")
##D plot(pg2, add = TRUE)
##D 
##D prj <- "+proj=laea +lon_0=0 +lat_0=-90 +ellps=WGS84"
##D xx <- c(-120, -100, -80, -60, -40); yy <- c(-65, -55, -45)
##D g3 <- graticule(xx, yy, ylim = c(-70, -30), proj = prj)
##D g3labs <- graticule_labels(xx, c(-65, -45), xline = -85, yline = -30, proj = prj)
##D plot(g3)
##D text(g3labs, lab = parse(text = g3labs$lab))
##D 
##D ## polygonal graticule on Orthographic projection
##D xx <- seq(-90, 90, length = 10) + 147
##D yy <- seq(-90, 90, length = 5)
##D portho <- "+proj=ortho +lon_0=147 +x_0=0 +y_0=0 +ellps=WGS84 +units=m +no_defs"
##D  g <- graticule(xx, yy, proj = portho, tiles = TRUE)
##D  plot(g, col = c("black", "grey"))
##D 
##D  library(maptools)
##D  data(wrld_simpl)
##D  w <- spTransform(subset(wrld_simpl, NAME == "Australia"), CRS(projection(g)))
##D  plot(w, add = TRUE, border = "dodgerblue")
##D  
## End(Not run)
## End(No test)



