library(mopa)


### Name: extractFromModel
### Title: Extrac objects from lists returned by function 'mopaTrain'
### Aliases: extractFromModel

### ** Examples

## Load presence data
data(Oak_phylo2)

## Load Climate data
destfile <- tempfile()
data.url <- "https://raw.githubusercontent.com/SantanderMetGroup/mopa/master/data/biostack.rda"
download.file(data.url, destfile)
load(destfile, verbose = TRUE)

## Spatial reference
r <- biostack$baseline[[1]]

## Create background grid
bg <- backgroundGrid(r)
## Generate pseudo-absences
RS_random <-pseudoAbsences(xy = Oak_phylo2, background = bg$xy, 
                           exclusion.buffer = 0.083*5, prevalence = -0.5, kmeans = FALSE)
## Model training
fittedRS <- mopaTrain(y = RS_random, x = biostack$baseline, 
                      k = 10, algorithm = "glm", weighting = TRUE)
## Extract fitted models
mods <- extractFromModel(models = fittedRS, value = "model")
## Extract observed and predicted values
ObsPred <- extractFromModel(models = fittedRS, value = "ObsPred")




