library(mkde)


### Name: writeRasterToVTK
### Title: Write a 2D raster to XDMF XML wrapper and binary data file.
### Aliases: writeRasterToVTK

### ** Examples

library(raster)
data(condordem120)
elev.val <- values(condordem120)
elev.min <- min(elev.val, na.rm=TRUE)
elev.max <- max(elev.val, na.rm=TRUE)

# make a color lookup table
cmap <- data.frame(value=c(0.0, 0.25, 0.5, 0.75, 1.0), 
  R=c(150, 179, 205, 192, 252), 
  G=c(224, 204, 205, 183, 243), 
  B=c(94, 147, 168, 147, 226))
                    
cmap$value <- cmap$value*(elev.max - elev.min) + elev.min
# red
f.R <- approxfun(cmap$value, cmap$R)
elev.r <- raster(condordem120)
values(elev.r) <- round(f.R(elev.val))
# green
f.G <- approxfun(cmap$value, cmap$G)
elev.g <- raster(condordem120)
values(elev.g) <- round(f.G(elev.val))
# blue
f.B <- approxfun(cmap$value, cmap$B)
elev.b <- raster(condordem120)
values(elev.b) <- round(f.B(elev.val))
writeRasterToVTK(condordem120, elev.r, elev.g, elev.b, "Elevation for
California condor Example", "condor_dem.vtk")



