library(Seurat)


### Name: ScaleData
### Title: Scale and center the data.
### Aliases: ScaleData

### ** Examples

pbmc_small <- ScaleData(object = pbmc_small)
## Not run: 
##D # To regress out certain effects
##D pbmc_small = ScaleData(object = pbmc_small, vars.to.regress = effects_list)
## End(Not run)




