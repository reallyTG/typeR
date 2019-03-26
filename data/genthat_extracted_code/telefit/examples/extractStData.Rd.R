library(telefit)


### Name: extractStData
### Title: Basic extraction of SpatialGridDataFrame data for teleconnection
###   analysis
### Aliases: extractStData

### ** Examples

# the extractRegion and extractStData methods create data matrices from 
# SpatialGridDataFrame objects

library(sp)

data("coprecip")
attach(coprecip)


#
# build SpatialGridDataFrame objects containing some of the coprecip data
#

gt = GridTopology(cellcentre.offset = apply(coords.s, 2, min),
                  cellsize = c(.5, .5), 
                  cells.dim = c(20, 12))

# Note: This is an example only; this grid will not match coprecip$coords.r
gt.Z = GridTopology(cellcentre.offset = apply(coords.r, 2, min),
                    cellsize = c(1.4, 1.4),
                    cells.dim = c(101, 52))

Xd = data.frame(`1981` = X[,2,1], `1982` = X[,2,2])
colnames(Xd) = gsub('X','', colnames(Xd))
sgdf.x = SpatialGridDataFrame(gt, Xd)


Yd = data.frame(`1981` = Y[,1], `1982` = Y[,2])
colnames(Yd) = gsub('X','', colnames(Yd))
sgdf.y = SpatialGridDataFrame(gt, Yd)


Zd = data.frame(`1981` = Z[,1], `1982` = Z[,2])
colnames(Zd) = gsub('X','', colnames(Zd))
sgdf.z = SpatialGridDataFrame(gt.Z, Zd)

# only extract a region of the coordinates
coprecip2 = extractStData(sgdf.x, sgdf.y, sgdf.z, 
                    D.s = c(-105, -103, 37, 41),
                    D.r = c(-160, -100, -15, 0))



