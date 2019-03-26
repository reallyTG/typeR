library(plot3D)


### Name: 3-D data set
### Title: Yearly averaged oxygen saturation from the NODC World Ocean
###   Atlas 2005.
### Aliases: Oxsat
### Keywords: datasets

### ** Examples

# save plotting parameters
 pm <- par("mfrow")

## ========================================================================
## plot all surface data
## ========================================================================

 par(mfrow = c(1, 1))
 image2D(z = Oxsat$val[ , , 1], x = Oxsat$lon, y = Oxsat$lat,
       main = "surface oxygen saturation (%) for 2005")

## ========================================================================
## plot a selection of latitude-depth profiles; input is an array
## ========================================================================

 lon <- Oxsat$lon
 image2D (z = Oxsat$val, margin = c(2, 3), x = Oxsat$lat, 
        y = Oxsat$depth, subset = (lon > 18 & lon < 23),
        ylim = c(5500, 0), NAcol = "black", zlim = c(0, 110),
        xlab = "latitude", ylab = "depth, m")

 ImageOcean()
 abline ( v = lon[lon > 18 & lon < 23])

## ========================================================================
## plot with slices
## ========================================================================

 par(mfrow = c(1, 1))
 ii <- which (Oxsat$lon > -90 & Oxsat$lon < 90)
 jj <- which (Oxsat$lat > 0 & Oxsat$lat < 90)

 xs <- Oxsat$lon[ii[length(ii)]]  # E boundary
 ys <- Oxsat$lat[jj[1]]           # S boundary

 slice3D(colvar = Oxsat$val[ii,jj,], x = Oxsat$lon[ii],  
        y = Oxsat$lat[jj], z = -Oxsat$depth,
        NAcol = "black", xs = xs, ys = ys, zs = 0, 
        theta = 35, phi = 50, colkey = list(length = 0.5),
        expand = 0.5, ticktype = "detailed",
        clab = "%", main = "Oxygen saturation", 
        xlab = "longitude", ylab = "latitude", zlab = "depth")

# restore plotting parameters
 par(mfrow = pm)



