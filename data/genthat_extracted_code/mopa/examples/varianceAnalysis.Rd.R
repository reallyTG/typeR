library(mopa)


### Name: varianceAnalysis
### Title: Variance analysis of RasterStack objects
### Aliases: varianceAnalysis

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
spplot(result$variance, col.regions = rev(get_col_regions()))



