library(mopa)


### Name: varianceSummary
### Title: Summary of the variance analysis results.
### Aliases: varianceSummary

### ** Examples

## Load climate data
destfile <- tempfile()
data.url <- "https://raw.githubusercontent.com/SantanderMetGroup/mopa/master/data/biostack.rda"
download.file(data.url, destfile)
load(destfile, verbose = TRUE)

## Fitted models
data(mods)
?mods

## Model prediction and analysis of the variability in projections
newClim <- lapply(1:4, function(x){
crop(biostack$future[[x]], extent(-10, 5, 35, 60))
})

prdRS.fut <- mopaPredict(models = mods, newClim = newClim)
result <- varianceAnalysis(prdRS.fut, "PA", "newClim")
## No test: 
## Summary of the results
varianceSummary(result, component = 2, regions = c(4, 6))

## Use a SpatialPolygons object for spatial subsetting

destfile <- tempfile()
data.url <- "https://github.com/SantanderMetGroup/visualizeR/raw/devel/data/PRUDENCEregions.rda"
download.file(data.url, destfile)
load(destfile, verbose = TRUE)
varianceSummary("mars" = result, component = 2, regions = PRUDENCEregions)
## End(No test)



