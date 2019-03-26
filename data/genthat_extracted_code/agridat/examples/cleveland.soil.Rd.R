library(agridat)


### Name: cleveland.soil
### Title: Soil resistivity in a field
### Aliases: cleveland.soil
### Keywords: datasets

### ** Examples


data(cleveland.soil)
dat <- cleveland.soil

# Similar to Cleveland fig 4.64
## require(latticeExtra)
## redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
## levelplot(resistivity ~ easting + northing, data = dat,
##           col.regions=redblue,
##           panel=panel.levelplot.points,
##           aspect=2.4, xlab= "Easting (km)", ylab= "Northing (km)",
##           main="cleveland")

# 2D loess plot. Cleveland fig 4.68
sg1 <- expand.grid(easting = seq(.15, 1.410, by = .02),
                   northing = seq(.150, 3.645, by = .02))
lo1 <- loess(resistivity~easting*northing, data=dat, span = 0.1, degree = 2)
fit1 <- predict(lo1, sg1)
require(lattice)
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(fit1 ~ sg1$easting * sg1$northing,
          col.regions=redblue,
          cuts = 9,
          aspect=2.4, xlab = "Easting (km)", ylab = "Northing (km)",
          main="cleveland.soil - 2D smooth of Resistivity")

# ----------------------------------------------------------------------------

## Not run: 
##D   # 3D loess plot with data overlaid
##D   require(rgl)
##D   bg3d(color = "white")
##D   clear3d()
##D   points3d(dat$easting, dat$northing, dat$resistivity / 100,
##D            col = rep("gray50", nrow(dat)))
##D   rgl::surface3d(seq(.15, 1.410, by = .02),
##D                  seq(.150, 3.645, by = .02),
##D                  fit1/100, alpha=0.9, col=rep("wheat", length(fit1)),
##D                  front="fill", back="fill")
##D   rgl.close()
## End(Not run)



