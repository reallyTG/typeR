library(rcosmo)


### Name: HPDataFrame
### Title: HPDataFrame class
### Aliases: HPDataFrame

### ** Examples


##Example 1.

hp1 <- HPDataFrame(I=rnorm(5), nside = 1, spix = c(1,1,2,2,3))
pix(hp1)
coords(hp1, new.coords = "cartesian")
class(hp1)
assumedUniquePix(hp1)

##Example 2.

# Where nside is not specified
sky <- CMBDataFrame(nside = 32, coords = "cartesian", ordering = "nested")
sky.s <- CMBDataFrame(sky, sample.size = 100)
hpdf <- HPDataFrame(sky.s, auto.spix = TRUE)
class(hpdf)
assumedUniquePix(hpdf)


# ## Example 3.
# ## Create a HPDataFrame with NON-UNIQUE pixel indices
#
# ## With earth data.
# ## Download World Cities Database from
# ## https://simplemaps.com/static/data/world-cities/basic/simplemaps_worldcities_basicv1.4.zip
# ## unpack the file worldcities.csv
#
# worldcities <- read.csv("worldcities.csv")
#
# ## Prepare a data frame with cities' coordinates
# sph <- geo2sph(data.frame(lon = pi/180*worldcities$lng,
#                           lat = pi/180*worldcities$lat))
# df <- data.frame(phi = sph$phi,
#                  theta = sph$theta,
#                  I = rep(1,nrow(sph)))
#
# ## Create and plot the corresponding HPDataFrame with
# ## pixel indices that are not necessarily unique
# ## by choosing your desired resolution (nside)
# hp <- HPDataFrame(usdf, auto.spix = TRUE, nside = 1024)
# plot(hp, size = 3, col = "darkgreen", back.col = "white")
# ## Add some pixels to visualise the sphere
# plot(CMBDataFrame(nside = 64), add = TRUE, col = "gray")

# ## Example 4.
# ## Create a HPDataFrame with UNIQUE pixel indices.
#
# ## With earth data.
# ## Download World Cities Database from
# ## https://simplemaps.com/static/data/world-cities/basic/simplemaps_worldcities_basicv1.4.zip
# ## unpack the file worldcities.csv
#
# worldcities <- read.csv("worldcities.csv")
# uscities <- worldcities[worldcities$country == "United States",]
#
# ## Prepare a data frame with cities' coordinates
# sph <- geo2sph(data.frame(lon = pi/180*uscities$lng,
#                           lat = pi/180*uscities$lat))
# usdf <- data.frame(phi = sph$phi,
#                    theta = sph$theta,
#                    I = rep(1,nrow(sph)))
#
# ## Select k cities with unique coordinates. The
# ## coordinates must be unique otherwise the
# ## automatically chosen separating nside
# ## will be infinite.
# k <- 1000
# usdf <- usdf[sample(nrow(usdf), k), ]
# plot(usdf$phi, usdf$theta)
# usdf[duplicated(usdf), ]
# usdf <- usdf[!duplicated(usdf), ]
# usdf[duplicated(usdf), ]
# usdf <- coords(usdf, new.coords = "cartesian")
#
# ## Create and plot the corresponding HPDataFrame . To make
# ## sure the pixels are unique, do not select a resolution
# ## resolution (nside), since it will be chosen automatically.
# ushp <- HPDataFrame(usdf, auto.spix = TRUE)
# nside(ushp)
# assumedUniquePix(ushp)
# plot(ushp, size = 3, col = "darkgreen", back.col = "white")
# ## Add some pixels to visualise the sphere
# plot(CMBDataFrame(nside = 64), add = TRUE, col = "gray")




