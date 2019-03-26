library(mopa)


### Name: backgroundRadius
### Title: Background extent restriction for a sequence of distances
### Aliases: backgroundRadius

### ** Examples


## Considering a single group of presence points
data(Q_pubescens)
presences <- Q_pubescens[sample(1:300, size = 100),]

# Define the spatial characteristics of the study area
r <- raster(nrows=50, ncols=50, xmn=-10, xmx=20, ymn=35, ymx=65, vals = rep(1, 50*50))

# Background of the whole study area
bg <- backgroundGrid(r)

# Partition of the study area
bg.extents <- backgroundRadius(xy = presences, background = bg$xy, 
                            start = 0.166, by = 0.083*50, unit = "decimal degrees")


## No test: 
## Considering more than one groups of presence points
data(Oak_phylo2)

# Obtaining the raster that defines the spatial characteristics of the study area
destfile <- tempfile()
data.url <- "https://raw.githubusercontent.com/SantanderMetGroup/mopa/master/data/biostack.rda"
download.file(data.url, destfile)
load(destfile, verbose = TRUE)

projection(biostack$baseline) <- CRS("+proj=longlat +init=epsg:4326")
r <- biostack$baseline[[1]]
# Background of the whole study area
bg <- backgroundGrid(r)

# Partition of the study area
bg.extents <- backgroundRadius(xy = Oak_phylo2, background = bg$xy, 
start = 0.166, by = 0.083*10, unit = "decimal degrees")
## End(No test)




