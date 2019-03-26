library(mopa)


### Name: pseudoAbsences
### Title: Pseudo-absence data generation
### Aliases: pseudoAbsences

### ** Examples


# SHORT EXAMPLE
## Load and prepare presence data
data(Q_pubescens)
presences <- Q_pubescens[sample(1:300, size = 100),]

## Define the spatial characteristics of the study area
r <- raster(nrows=50, ncols=50, xmn=-10, xmx=20, ymn=35, ymx=65, vals = rep(1, 50*50))

## Background of the whole study area
bg <- backgroundGrid(r)

## Generate pseudo-absences considering an unique background extent
RS_random <-pseudoAbsences(xy = presences, background = bg$xy, 
                           exclusion.buffer = 0.083*5, 
                           prevalence = -0.5, kmeans = FALSE)


## No test: 
# FULL WORKED EXAMPLE
## Load presence data
data(Oak_phylo2)

## Load climate data 
destfile <- tempfile()
data.url <- "https://raw.githubusercontent.com/SantanderMetGroup/mopa/master/data/biostack.rda"
download.file(data.url, destfile)
load(destfile, verbose = TRUE)

projection(biostack$baseline) <- CRS("+proj=longlat +init=epsg:4326")
r <- biostack$baseline[[1]]
## Background of the whole study area
bg <- backgroundGrid(r)

## Environmental profiling of the background
bg.profiled <- OCSVMprofiling(xy = Oak_phylo2, varstack = biostack$baseline, 
                              background = bg$xy)

## Generate pseudo-absences considering an unique background extent
RS_random <-pseudoAbsences(xy = Oak_phylo2, background = bg$xy, 
                           exclusion.buffer = 0.083*5, 
                           prevalence = -0.5, kmeans = FALSE)
RSEP_random <-pseudoAbsences(xy = Oak_phylo2, background = bg.profiled$absence, 
                             exclusion.buffer = 0.083*5, 
                             prevalence = -0.5, kmeans = FALSE)

## Background partition into different extents
bg.extents <- backgroundRadius(xy = Oak_phylo2, background = bg$xy, 
                               start = 0.166, by = 0.083*20, 
                               unit = "decimal degrees")

## Generate pseudo-absences considering different background extents
TS_random <-pseudoAbsences(xy = Oak_phylo2, background = bg.extents, 
                           exclusion.buffer = 0.083*10, 
                           prevalence = -0.5, kmeans = FALSE)


## with k-means clustering
TS_kmeans <-pseudoAbsences(xy = Oak_phylo2, background = bg.extents, 
                           exclusion.buffer = 0.083*5, 
                           prevalence = -0.5, kmeans = TRUE, 
                           varstack = biostack$baseline)
## End(No test)




