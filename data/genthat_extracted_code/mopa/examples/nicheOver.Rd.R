library(mopa)


### Name: nicheOver
### Title: Niche overlap
### Aliases: nicheOver

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
names(newClim) <- names(biostack$future)[1:4]
prdRS.fut <- mopaPredict(models = mods, newClim = newClim)

## Extract predictions for pseudo-absence realizaion number 1
predsPA01 <- extractFromPrediction(predictions = prdRS.fut, value = "PA01")
no <- nicheOver(predsPA01, metric = "D")
library(lattice)
levelplot(no, col.regions = rev(terrain.colors(16)))

## No test: 
# FULL WORKED EXAMPLE
## Load climate data
destfile <- tempfile()
data.url <- "https://raw.githubusercontent.com/SantanderMetGroup/mopa/master/data/biostack.rda"
download.file(data.url, destfile)
load(destfile, verbose = TRUE)

## Load fitted models
data(mods)
?mods # see how it is generated
## Model prediction
preds <- mopaPredict(models = mods, newClim = biostack$future)

## Extract predictions for pseudo-absence realizaion number 1
preds1 <- extractFromPrediction(predictions = preds, value = "PA01")

## Compute niche overlap
no <- nicheOver(preds1, metric = "D")
library(lattice)
levelplot(no, col.regions = rev(terrain.colors(16)))
## End(No test)




