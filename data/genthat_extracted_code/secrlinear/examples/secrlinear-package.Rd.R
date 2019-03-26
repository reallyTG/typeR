library(secrlinear)


### Name: secrlinear-package
### Title: Spatially Explicit Capture-Recapture for Linear Habitats
### Aliases: secrlinear
### Keywords: package

### ** Examples


## Water voles in June 1984 on the R. Glyme in Oxfordshire, UK
## capture and trap location files are exactly as for a 2-D analysis

inputdir <- system.file("extdata", package = "secrlinear")
arvicola <- read.capthist(captfile = paste0(inputdir, "/Jun84capt.txt"), 
    trapfile = paste0(inputdir, "/glymetrap.txt"), detector = "multi", 
    covname = "sex")

## Import map of linear habitat
## -- from text file of x-y coordinates
glymemask <- read.linearmask(file = paste0(inputdir, "/glymemap.txt"), spacing = 4)
## -- from a previously constructed SpatialLinesDataFrame
library(rgdal)
SLDF <- rgdal::readOGR(dsn = paste0(inputdir,"/glymemap.shp"), layer = "glymemap")
glymemask <- read.linearmask(data = SLDF, spacing = 4)

## display the mask and capture data
plot (glymemask)
plot(arvicola, add = TRUE, tracks = TRUE)
plot(traps(arvicola), add = TRUE)

## fit model, estimate density
linearfit <- secr.fit(arvicola, mask = glymemask, trace = FALSE,
    details = list(userdist = networkdistance))
predict(linearfit)

## NOTE : the unit of density (D) is animals / km



