library(latticeExtra)


### Name: panel.3dmisc
### Title: Miscellanous panel utilities for three dimensional Trellis
###   Displays
### Aliases: panel.3dmisc panel.3dtext panel.3dbars panel.3dpolygon
### Keywords: dplot

### ** Examples


library(lattice)

cloud(VADeaths, panel.3d.cloud = panel.3dbars,
      col.facet = "grey", xbase = 0.4, ybase = 0.4,
      screen = list(z = 40, x = -30))

cloud(VADeaths, panel.3d.cloud = panel.3dbars,
      xbase = 0.4, ybase = 0.4, zlim = c(0, max(VADeaths)),
      scales = list(arrows = FALSE, just = "right"), xlab = NULL, ylab = NULL,
      col.facet = level.colors(VADeaths, at = do.breaks(range(VADeaths), 20),
                               col.regions = terrain.colors,
                               colors = TRUE),
      colorkey = list(col = terrain.colors, at = do.breaks(range(VADeaths), 20)),
      screen = list(z = 40, x = -30))


cloud(as.table(prop.table(Titanic, margin = 1:3)[,,,2]),
      type = c("p", "h"),
      zlab = "Proportion\nSurvived",
      panel.3d.cloud = panel.3dbars,
      xbase = 0.4, ybase = 0.4,
      aspect = c(1, 0.3),
      scales = list(distance = 2),
      panel.aspect = 0.5)




