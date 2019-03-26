library(metR)


### Name: geom_streamline
### Title: Streamlines
### Aliases: geom_streamline stat_streamline StatStreamline GeomStreamline
### Keywords: datasets

### ** Examples

## Not run: 
##D library(data.table)
##D library(ggplot2)
##D data(geopotential)
##D 
##D geopotential <- copy(geopotential)[date == date[1]]
##D geopotential[, gh.z := Anomaly(gh), by = .(lat)]
##D geopotential[, c("u", "v") := GeostrophicWind(gh.z, lon, lat)]
##D 
##D (g <- ggplot(geopotential, aes(lon, lat)) +
##D     geom_contour2(aes(z = gh.z), xwrap = c(0, 360)) +
##D     geom_streamline(aes(dx = dlon(u, lat), dy = dlat(v)), L = 60,
##D                     xwrap = c(0, 360)))
##D 
##D # The circular parameter is particularly important for polar coordinates
##D g + coord_polar()
##D 
##D # If u and v are not converted into degrees/second, the resulting
##D # streamlines have problems, specially near the pole.
##D ggplot(geopotential, aes(lon, lat)) +
##D     geom_contour(aes(z = gh.z)) +
##D     geom_streamline(aes(dx = u, dy = v), L = 50)
##D 
##D # The step variable can be mapped to size or alpha to
##D # get cute "drops". It's important to note that ..dx.. (the calculated variable)
##D # is NOT the same as dx (from the data).
##D ggplot(geopotential, aes(lon, lat)) +
##D     geom_streamline(aes(dx = dlon(u, lat), dy = dlat(v), alpha = ..step..,
##D                         color = sqrt(..dx..^2 + ..dy..^2), size = ..step..),
##D                         L = 40, xwrap = c(0, 360), res = 2, arrow = NULL,
##D                         lineend = "round") +
##D     scale_size(range = c(0, 0.6))
##D 
##D # Using topographic information to simulate "rivers" from slope
##D topo <- GetTopography(295, -55+360, -30, -42, res = 1/20)  # needs internet!
##D topo[, c("dx", "dy") := Derivate(h ~ lon + lat)]
##D topo[h <= 0, c("dx", "dy") := 0]
##D 
##D # See how in this example the integration step is too coarse in the
##D # western montanous region where the slope is much higher than in the
##D # flatlands of La Pampa at in the east.
##D ggplot(topo, aes(lon, lat)) +
##D     geom_relief(aes(z = h), interpolate = TRUE, data = topo[h >= 0]) +
##D     geom_contour(aes(z = h), breaks = 0, color = "black") +
##D     geom_streamline(aes(dx = -dx, dy = -dy), L = 10, skip = 3, arrow = NULL,
##D                     color = "#4658BD") +
##D     coord_quickmap()
##D  
## End(Not run)




