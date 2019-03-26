library(adegraphics)


### Name: s.image
### Title: 2-D scatter plot with loess estimation of an additional numeric
###   score (levelplot)
### Aliases: s.image
### Keywords: aplot hplot

### ** Examples

df1 <- data.frame(expand.grid(-3:3, -3:3))
names(df1) <- c("x", "y")
z1 <- (1 / sqrt(2)) * exp(-(df1$x ^ 2 + df1$y ^ 2) / 2)
g1 <- s.image(df1, z1)

# add a continuous color bar as legend
# update(g1, plegend.drawColorKey = TRUE)

g2 <- s.image(df1, z1, gridsize = 50)

g3 <- s.image(df1, z1, gridsize = 100)
## g4 <- s.image(df1, z1, gridsize = 1000, plot = FALSE)

## Not run: 
##D   if(require(splancs, quietly = TRUE) & require(sp, quietly = TRUE)) {
##D     Sr1 <- Polygon(cbind(c(0, 1, 2, 1, 2, 0, -2, -1, -2, -1, 0), 
##D       c(2.5, 1.5, 2, 0, -2, -1, -2, 0, 2, 1.5, 2.5)))
##D     Sr2 <- Polygon(cbind(c(-0.5, 0.5, 0.5, -0.5, -0.5), c(0, 0, 1 ,1, 0)), hole = TRUE)
##D     Srs2 <- Polygons(list(Sr1, Sr2), ID = "star and hole")
##D     SPp <- SpatialPolygons(list(Srs2))
##D     df2 <- cbind(c(rnorm(2000, 1, 0.25), rnorm(3000, -1, 1.5)), c(rnorm(2000, 1, 0.5), 
##D       rnorm(3000, -1, 3)))
##D     z2 <- c(rnorm(2000, 12, 1), rnorm(3000, 1, 2))
##D     g5 <- s.image(df2, z2, outsideLimits = SPp, grid = 200, xlim = c(-2.5, 2.5), 
##D       ylim = c(-2, 3), ppalette.quanti = colorRampPalette(c(grey(0.1), grey(0.9))))
##D   
##D     data(t3012, package = "ade4")  
##D     g6 <- s.image(t3012$xy, ade4::scalewt(t3012$temp), porigin.include = FALSE)
##D     g7 <- s.image(t3012$xy, ade4::scalewt(t3012$temp), outsideLimits = t3012$Spatial, 
##D       Sp = t3012$Spatial)
##D   }
## End(Not run)



