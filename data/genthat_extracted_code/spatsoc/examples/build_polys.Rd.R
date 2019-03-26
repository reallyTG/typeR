library(spatsoc)


### Name: build_polys
### Title: Build Polygons
### Aliases: build_polys

### ** Examples

# Load data.table
library(data.table)

# Read example data
DT <- fread(system.file("extdata", "DT.csv", package = "spatsoc"))

# Cast the character column to POSIXct
DT[, datetime := as.POSIXct(datetime, tz = 'UTC')]

# Proj4 string for example data
utm <- '+proj=utm +zone=36 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs'

# Build polygons for each individual using kernelUD and getverticeshr
build_polys(DT, projection = utm, hrType = 'kernel',
            hrParams = list(grid = 60, percent = 95),
            id = 'ID', coords = c('X', 'Y'))

# Build polygons for each individual by year
DT[, yr := year(datetime)]
build_polys(DT, projection = utm, hrType = 'mcp', hrParams = list(percent = 95),
            id = 'ID', coords = c('X', 'Y'), splitBy = 'yr')

# Build polygons from SpatialPointsDataFrame
library(sp)
pts <- SpatialPointsDataFrame(coords = DT[, .(X, Y)],
                              proj4string = CRS(utm),
                              data = DT[, .(ID)]
)

build_polys(spPts = pts, hrType = 'mcp', hrParams = list(percent = 95))




