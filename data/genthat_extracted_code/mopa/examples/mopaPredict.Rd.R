library(mopa)


### Name: mopaPredict
### Title: Model prediction
### Aliases: mopaPredict

### ** Examples

# SHORT EXAMPLE
destfile <- tempfile()
data.url <- "https://raw.githubusercontent.com/SantanderMetGroup/mopa/master/data/biostack.rda"
download.file(data.url, destfile)
load(destfile, verbose = TRUE)

## Fitted models
data(mods)
?mods

## Model prediction
newClim <- lapply(1:4, function(x){
crop(biostack$future[[x]], extent(-10, 10, 35, 65))
})

prdRS.fut <- mopaPredict(models = mods, newClim = newClim)

## No test: 
# FULL WORKED EXAMPLE
## Load presence data
data(Oak_phylo2)

## Load climate data
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

## Model prediction
preds <- mopaPredict(models = mods, newClim = biostack$future)
## End(No test)




